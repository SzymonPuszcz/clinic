package org.clinic.mapper

import org.clinic.dto.appointment.AppointmentDto
import org.clinic.dto.appointment.CreateAppointmentDto
import org.clinic.dto.appointment.UpdateAppointmentDto
import org.clinic.model.Appointment
import org.clinic.model.Doctor
import org.clinic.model.Patient
import org.modelmapper.ModelMapper
import org.springframework.stereotype.Component

@Component
class AppointmentMapper(
    modelMapper: ModelMapper
) : BaseMapper(modelMapper) {
    fun map(appointment: Appointment): AppointmentDto = modelMapper.map(appointment, AppointmentDto::class.java)

    fun map(createAppointmentDto: CreateAppointmentDto, doctor: Doctor, patient: Patient): Appointment =
        modelMapper.map(createAppointmentDto, Appointment::class.java).apply {
            this.doctor = doctor
            this.patient = patient
        }

    fun update(updateAppointmentDto: UpdateAppointmentDto, appointment: Appointment) {
        modelMapper.map(updateAppointmentDto, appointment)
    }
}
