package org.clinic.dto

import org.clinic.annotation.Dto

@Dto
data class ApiErrorDto(
    val error: String
)
