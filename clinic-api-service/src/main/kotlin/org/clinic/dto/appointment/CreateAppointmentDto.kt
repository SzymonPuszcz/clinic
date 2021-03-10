package org.clinic.dto.appointment

import org.clinic.annotation.Dto
import org.clinic.constants.ValidationConst
import org.clinic.validation.DateTimeFormat
import javax.validation.constraints.NotBlank

@Dto
data class CreateAppointmentDto(
    var doctorId: String,

    var patientId: String,

    @field:DateTimeFormat(pattern = ValidationConst.DATE_YYYY_MM_DD_HH_MM_FORMAT)
    var startDate: String,

    @field:NotBlank
    var location: String
)
