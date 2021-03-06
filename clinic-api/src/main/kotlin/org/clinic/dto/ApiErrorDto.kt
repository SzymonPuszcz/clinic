package org.clinic.dto

import com.fasterxml.jackson.annotation.JsonInclude
import org.clinic.annotation.Dto

@Dto
@JsonInclude(value = JsonInclude.Include.NON_NULL)
data class ApiErrorDto(
    val message: String,
    val errors: List<String>? = null
)
