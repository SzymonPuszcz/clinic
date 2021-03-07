package org.clinic.service

import org.clinic.model.Patient
import java.util.UUID

interface PatientService {
    fun getPatient(id: UUID): Patient

    fun save(patient: Patient): Patient

    fun deletePatient(id: UUID)
}
