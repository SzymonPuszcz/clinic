package org.clinic.apiservice

import org.clinic.dto.doctor.CreateDoctorDto
import org.clinic.dto.doctor.DoctorDto

interface DoctorApiService {
    fun getDoctor(id: String): DoctorDto

    fun createDoctor(createDoctorDto: CreateDoctorDto): DoctorDto

    fun updateDoctor(id: String, createDoctorDto: CreateDoctorDto): DoctorDto

    fun deleteDoctor(id: String)
}
