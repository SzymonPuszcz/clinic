package org.clinic.controller.advice

import org.clinic.dto.ApiErrorDto
import org.clinic.exception.IllegalUUIDValue
import org.clinic.exception.ResourceNotFound
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.http.converter.HttpMessageNotReadableException
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler

@ControllerAdvice
class RestExceptionHandler {
    @ExceptionHandler(IllegalUUIDValue::class)
    fun handleIllegalUUIDValue(ex: IllegalUUIDValue): ResponseEntity<ApiErrorDto> =
        ResponseEntity
            .badRequest()
            .body(ApiErrorDto("Illegal id value"))

    @ExceptionHandler(ResourceNotFound::class)
    fun handleIllegalUUIDValue(ex: ResourceNotFound): ResponseEntity<ApiErrorDto> =
        ResponseEntity
            .status(HttpStatus.NOT_FOUND)
            .body(ApiErrorDto("Not found"))

    @ExceptionHandler(MethodArgumentNotValidException::class)
    fun handleIllegalUUIDValue(ex: MethodArgumentNotValidException): ResponseEntity<ApiErrorDto> =
        ResponseEntity
            .badRequest()
            .body(
                ApiErrorDto(
                    "Request is not valid",
                    ex.bindingResult.fieldErrors.map { it.defaultMessage.toString() }
                )
            )

    @ExceptionHandler(HttpMessageNotReadableException::class)
    fun handleIllegalUUIDValue(ex: HttpMessageNotReadableException): ResponseEntity<ApiErrorDto> =
        ResponseEntity
            .badRequest()
            .body(
                ApiErrorDto(
                    "Request is not valid"
                )
            )
}
