package org.clinic.mapper

import org.clinic.dto.doctor.CreateDoctorDto
import org.clinic.dto.doctor.DoctorDto
import org.clinic.model.Doctor
import org.modelmapper.ModelMapper
import org.springframework.stereotype.Component

@Component
class DoctorMapper(
    modelMapper: ModelMapper
) : BaseMapper(modelMapper) {
    fun map(doctor: Doctor): DoctorDto = modelMapper.map(doctor, DoctorDto::class.java)

    fun map(createDoctorDto: CreateDoctorDto): Doctor = modelMapper.map(createDoctorDto, Doctor::class.java)

    fun map(source: CreateDoctorDto, dest: Doctor) = modelMapper.map(source, dest)
}
