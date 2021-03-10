package org.clinic.dto.appointment

import org.clinic.annotation.Dto
import org.clinic.constants.ValidationConst
import org.clinic.validation.DateTimeFormat

@Dto
data class UpdateAppointmentDto(
    @field:DateTimeFormat(pattern = ValidationConst.DATE_YYYY_MM_DD_HH_MM_FORMAT)
    var startDate: String,
)
