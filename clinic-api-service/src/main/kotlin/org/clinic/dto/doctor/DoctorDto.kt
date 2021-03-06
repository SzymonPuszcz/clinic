package org.clinic.dto.doctor

import org.clinic.annotation.Dto

@Dto
data class DoctorDto(
    var id: String,
    var firstName: String,
    var lastName: String,
    var address: String
)
