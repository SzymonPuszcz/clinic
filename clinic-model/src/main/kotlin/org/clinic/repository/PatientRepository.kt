package org.clinic.repository

import org.clinic.model.Patient
import org.springframework.data.jpa.repository.JpaRepository
import java.util.UUID

interface PatientRepository : JpaRepository<Patient, UUID>
