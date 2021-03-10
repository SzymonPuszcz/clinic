package org.clinic.apiservice

import org.clinic.dto.appointment.AppointmentDto
import org.clinic.dto.appointment.CreateAppointmentDto
import org.clinic.dto.appointment.UpdateAppointmentDto
import org.clinic.dto.page.PageRequestDto
import org.clinic.dto.page.PageResponseDto

interface AppointmentApiService {
    fun getAppointments(patientId: String?, pageRequestDto: PageRequestDto): PageResponseDto<AppointmentDto>

    fun createAppointment(createAppointmentDto: CreateAppointmentDto): AppointmentDto

    fun deleteAppointment(id: String)

    fun updateAppointment(id: String, updateAppointmentDto: UpdateAppointmentDto): AppointmentDto
}
