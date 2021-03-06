package org.clinic.controller.advice

import org.clinic.dto.ApiErrorDto
import org.clinic.exception.IllegalUUIDValue
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler

@ControllerAdvice
class RestExceptionHandler {
    @ExceptionHandler(IllegalUUIDValue::class)
    fun handleIllegalUUIDValue(ex: IllegalUUIDValue): ResponseEntity<ApiErrorDto> =
        ResponseEntity
            .badRequest()
            .body(ApiErrorDto("Illegal id value"))
}
