package org.clinic.dto.patient

import org.clinic.annotation.Dto

@Dto
data class PatientDto(
    var id: String,

    var firstName: String,

    var lastName: String,

    var address: String
)
