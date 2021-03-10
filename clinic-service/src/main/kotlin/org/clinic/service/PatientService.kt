package org.clinic.service

import org.clinic.model.Patient
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import java.util.UUID

interface PatientService {
    fun getAllPatients(pageable: Pageable): Page<Patient>

    fun getPatient(id: UUID): Patient

    fun savePatient(patient: Patient): Patient

    fun deletePatient(id: UUID)
}
