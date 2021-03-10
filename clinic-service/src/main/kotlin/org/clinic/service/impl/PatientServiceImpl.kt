package org.clinic.service.impl

import org.clinic.exception.ResourceNotFoundException
import org.clinic.model.Patient
import org.clinic.repository.PatientRepository
import org.clinic.service.PatientService
import org.clinic.util.propertyReferenceExceptionWrapper
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service
import java.util.UUID

@Service
class PatientServiceImpl(
    private val patientRepository: PatientRepository
) : PatientService {
    override fun getAllPatients(pageable: Pageable): Page<Patient> =
        propertyReferenceExceptionWrapper { patientRepository.findAll(pageable) }

    override fun getPatient(id: UUID): Patient =
        patientRepository.findByIdOrNull(id) ?: throw ResourceNotFoundException()

    override fun savePatient(patient: Patient): Patient = patientRepository.save(patient)

    override fun deletePatient(id: UUID) {
        if (patientRepository.existsById(id))
            patientRepository.deleteById(id)
    }
}
