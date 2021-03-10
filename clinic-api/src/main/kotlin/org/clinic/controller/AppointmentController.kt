package org.clinic.controller

import org.clinic.apiservice.AppointmentApiService
import org.clinic.dto.appointment.AppointmentDto
import org.clinic.dto.appointment.CreateAppointmentDto
import org.clinic.dto.appointment.UpdateAppointmentDto
import org.clinic.dto.page.PageRequestDto
import org.clinic.dto.page.PageResponseDto
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestController
import javax.validation.Valid

@RestController
@RequestMapping("/appointment")
class AppointmentController(
    private val appointmentApiService: AppointmentApiService
) {
    @GetMapping
    fun getAllAppointments(@RequestParam patientId: String?, pageRequestDto: PageRequestDto): PageResponseDto<AppointmentDto> =
        appointmentApiService.getAppointments(patientId, pageRequestDto)

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createAppointment(@Valid @RequestBody createAppointmentDto: CreateAppointmentDto) =
        appointmentApiService.createAppointment(createAppointmentDto)

    @PutMapping("{id}")
    fun updateAppointment(@PathVariable id: String, @Valid @RequestBody updateAppointmentDto: UpdateAppointmentDto) =
        appointmentApiService.updateAppointment(id, updateAppointmentDto)

    @DeleteMapping("{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteAppointment(@PathVariable id: String) = appointmentApiService.deleteAppointment(id)
}
