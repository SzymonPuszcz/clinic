package org.clinic.apiservice.impl

import org.clinic.apiservice.DoctorApiService
import org.clinic.dto.doctor.CreateDoctorDto
import org.clinic.dto.doctor.DoctorDto
import org.clinic.ext.toUUID
import org.clinic.mapper.DoctorMapper
import org.clinic.service.DoctorService
import org.springframework.stereotype.Service

@Service
class DoctorApiServiceImpl(
    private val doctorService: DoctorService,
    private val doctorMapper: DoctorMapper
) : DoctorApiService {
    override fun getDoctor(id: String): DoctorDto =
        getDoctorById(id).let {
            doctorMapper.map(it)
        }

    override fun createDoctor(createDoctorDto: CreateDoctorDto): DoctorDto =
        doctorMapper.map(createDoctorDto).let {
            val createdDoctor = doctorService.saveDoctor(it)
            doctorMapper.map(createdDoctor)
        }

    override fun updateDoctor(id: String, createDoctorDto: CreateDoctorDto): DoctorDto =
        getDoctorById(id).let {
            doctorMapper.map(createDoctorDto, it)
            doctorService.saveDoctor(it)
            doctorMapper.map(it)
        }

    override fun deleteDoctor(id: String) = doctorService.deleteDoctor(id.toUUID())

    private fun getDoctorById(id: String) = doctorService.getDoctor(id.toUUID())
}
