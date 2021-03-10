package org.clinic.service.impl

import org.clinic.exception.ResourceNotFoundException
import org.clinic.model.Doctor
import org.clinic.repository.DoctorRepository
import org.clinic.service.DoctorService
import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service
import java.util.UUID

@Service
class DoctorServiceImpl(
    private val doctorRepository: DoctorRepository
) : DoctorService {
    override fun getDoctor(id: UUID): Doctor =
        doctorRepository.findByIdOrNull(id) ?: throw ResourceNotFoundException()

    override fun saveDoctor(doctor: Doctor): Doctor = doctorRepository.save(doctor)

    override fun deleteDoctor(id: UUID) {
        if (doctorRepository.existsById(id))
            doctorRepository.deleteById(id)
    }
}
