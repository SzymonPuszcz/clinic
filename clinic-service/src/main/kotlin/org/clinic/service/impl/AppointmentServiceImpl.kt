package org.clinic.service.impl

import org.clinic.exception.ResourceNotFoundException
import org.clinic.model.Appointment
import org.clinic.model.Doctor
import org.clinic.model.Patient
import org.clinic.repository.AppointmentRepository
import org.clinic.service.AppointmentService
import org.clinic.util.propertyReferenceExceptionWrapper
import org.springframework.data.domain.Page
import org.springframework.data.domain.Pageable
import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service
import java.time.LocalDateTime
import java.util.UUID

@Service
class AppointmentServiceImpl(
    private val appointmentRepository: AppointmentRepository
) : AppointmentService {
    override fun getAllAppointments(pageable: Pageable): Page<Appointment> =
        propertyReferenceExceptionWrapper { appointmentRepository.findAll(pageable) }

    override fun getAllPatientAppointments(patient: Patient, pageable: Pageable): Page<Appointment> =
        propertyReferenceExceptionWrapper { appointmentRepository.findAllByPatient(patient, pageable) }

    override fun getAppointment(uuid: UUID): Appointment =
        appointmentRepository.findByIdOrNull(uuid) ?: throw ResourceNotFoundException()

    override fun saveAppointment(appointment: Appointment): Appointment = appointmentRepository.save(appointment)

    override fun deleteAppointment(uuid: UUID) {
        if (appointmentRepository.existsById(uuid))
            appointmentRepository.deleteById(uuid)
    }

    override fun exists(doctor: Doctor, startDate: LocalDateTime): Boolean =
        appointmentRepository.existsByDoctorAndStartDate(doctor, startDate)
}
