package org.clinic.apiservice.impl

import org.clinic.apiservice.PatientApiService
import org.clinic.dto.patient.CreatePatientDto
import org.clinic.dto.patient.PatientDto
import org.clinic.ext.toUUID
import org.clinic.mapper.PatientMapper
import org.clinic.service.PatientService
import org.springframework.stereotype.Service

@Service
class PatientApiServiceImpl(
    private val patientService: PatientService,
    private val patientMapper: PatientMapper
) : PatientApiService {
    override fun getPatient(id: String): PatientDto =
        getPatientById(id).let {
            patientMapper.map(it)
        }

    override fun createPatient(createPatientDto: CreatePatientDto): PatientDto =
        patientMapper.map(createPatientDto).let {
            patientService.save(it)
            patientMapper.map(it)
        }

    override fun updatePatient(id: String, createPatientDto: CreatePatientDto): PatientDto {
        return getPatientById(id).let {
            patientMapper.map(createPatientDto, it)
            patientService.save(it)
            patientMapper.map(it)
        }
    }

    override fun deletePatient(id: String) = patientService.deletePatient(id.toUUID())

    private fun getPatientById(id: String) = patientService.getPatient(id.toUUID())
}
