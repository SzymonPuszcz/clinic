package org.clinic.apiservice

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

    private fun getDoctorById(id: String) = doctorService.getDoctor(id.toUUID())

    override fun createDoctor(createDoctorDto: CreateDoctorDto): DoctorDto =
        doctorMapper.map(createDoctorDto).let {
            val createdDoctor = doctorService.save(it)
            doctorMapper.map(createdDoctor)
        }

    override fun updateDoctor(id: String, createDoctorDto: CreateDoctorDto): DoctorDto =
        getDoctorById(id).let {
            doctorMapper.map(createDoctorDto, it)
            doctorService.save(it)
            doctorMapper.map(it)
        }

    override fun deleteDoctor(id: String) = doctorService.deleteDoctor(id.toUUID())
}
