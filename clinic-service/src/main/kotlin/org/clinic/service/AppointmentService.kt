package org.clinic.service

import org.clinic.model.Appointment
import org.clinic.model.Doctor
import org.clinic.model.Patient
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import java.time.LocalDateTime
import java.util.UUID

interface AppointmentService {
    fun getAllAppointments(pageable: Pageable): Page<Appointment>

    fun getAllPatientAppointments(patient: Patient, pageable: Pageable): Page<Appointment>

    fun getAppointment(uuid: UUID): Appointment

    fun saveAppointment(appointment: Appointment): Appointment

    fun deleteAppointment(uuid: UUID)

    fun exists(doctor: Doctor, startDate: LocalDateTime): Boolean
}
