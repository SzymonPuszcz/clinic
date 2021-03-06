package org.clinic.repository

import org.clinic.model.Doctor
import org.springframework.data.jpa.repository.JpaRepository
import java.util.UUID

interface DoctorRepository : JpaRepository<Doctor, UUID>
