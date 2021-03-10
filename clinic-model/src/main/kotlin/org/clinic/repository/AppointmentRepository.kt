package org.clinic.repository

import org.clinic.model.Appointment
import org.clinic.model.Doctor
import org.clinic.model.Patient
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.jpa.repository.JpaRepository
import java.time.LocalDateTime
import java.util.UUID

interface AppointmentRepository : JpaRepository<Appointment, UUID> {
    fun findAllByPatient(patient: Patient, pageable: Pageable): Page<Appointment>

    fun existsByDoctorAndStartDate(doctor: Doctor, startDate: LocalDateTime): Boolean
}
