package org.clinic.apiservice.impl

import org.clinic.apiservice.AppointmentApiService
import org.clinic.dto.appointment.AppointmentDto
import org.clinic.dto.appointment.CreateAppointmentDto
import org.clinic.dto.appointment.UpdateAppointmentDto
import org.clinic.dto.page.PageRequestDto
import org.clinic.dto.page.PageResponseDto
import org.clinic.exception.DateBusyAppointmentException
import org.clinic.exception.IllegalAppointmentValueException
import org.clinic.exception.PastDateException
import org.clinic.exception.ResourceNotFoundException
import org.clinic.ext.toPageResponseDto
import org.clinic.ext.toPageable
import org.clinic.ext.toUUID
import org.clinic.mapper.AppointmentMapper
import org.clinic.model.Appointment
import org.clinic.service.AppointmentService
import org.clinic.service.DoctorService
import org.clinic.service.PatientService
import org.springframework.stereotype.Service
import java.time.LocalDateTime

@Service
class AppointmentApiServiceImpl(
    private val appointmentService: AppointmentService,
    private val doctorService: DoctorService,
    private val patientService: PatientService,
    private val appointmentMapper: AppointmentMapper
) : AppointmentApiService {
    override fun getAppointments(patientId: String?, pageRequestDto: PageRequestDto): PageResponseDto<AppointmentDto> {
        val pageable = pageRequestDto.toPageable()
        val appointments = patientId?.toUUID()?.let {
            val patient = patientService.getPatient(it)
            appointmentService.getAllPatientAppointments(patient, pageable)
        } ?: appointmentService.getAllAppointments(pageable)

        return appointments.map(appointmentMapper::map).toPageResponseDto()
    }

    override fun createAppointment(createAppointmentDto: CreateAppointmentDto): AppointmentDto =
        map(createAppointmentDto).let {
            save(it)
            return appointmentMapper.map(it)
        }

    override fun deleteAppointment(id: String) = appointmentService.deleteAppointment(id.toUUID())

    override fun updateAppointment(id: String, updateAppointmentDto: UpdateAppointmentDto): AppointmentDto =
        appointmentService.getAppointment(id.toUUID()).let {
            appointmentMapper.update(updateAppointmentDto, it)
            save(it)
            appointmentMapper.map(it)
        }

    private fun map(createAppointmentDto: CreateAppointmentDto): Appointment =
        try {
            val doctor = doctorService.getDoctor(createAppointmentDto.doctorId.toUUID())
            val patient = patientService.getPatient(createAppointmentDto.patientId.toUUID())
            appointmentMapper.map(createAppointmentDto, doctor, patient)
        } catch (ex: ResourceNotFoundException) {
            throw IllegalAppointmentValueException()
        }

    private fun save(appointment: Appointment) {
        validateAppointment(appointment)
        appointmentService.saveAppointment(appointment)
    }

    private fun validateAppointment(appointment: Appointment) {
        if (LocalDateTime.now().isAfter(appointment.startDate))
            throw PastDateException()
        if (isDateBusy(appointment))
            throw DateBusyAppointmentException()
    }

    private fun isDateBusy(appointment: Appointment): Boolean =
        appointmentService.exists(appointment.doctor, appointment.startDate)
}
