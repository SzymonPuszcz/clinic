package org.clinic.mapper

import org.clinic.dto.patient.CreatePatientDto
import org.clinic.dto.patient.PatientDto
import org.clinic.model.Patient
import org.modelmapper.ModelMapper
import org.springframework.stereotype.Component

@Component
class PatientMapper(
    private val modelMapper: ModelMapper
) {
    fun map(patient: Patient): PatientDto = modelMapper.map(patient, PatientDto::class.java)

    fun map(createPatientDto: CreatePatientDto): Patient = modelMapper.map(createPatientDto, Patient::class.java)

    fun map(source: CreatePatientDto, dest: Patient) = modelMapper.map(source, dest)
}
