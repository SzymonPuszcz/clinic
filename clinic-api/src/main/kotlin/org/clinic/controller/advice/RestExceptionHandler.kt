package org.clinic.controller.advice

import org.clinic.dto.ApiErrorDto
import org.clinic.exception.IllegalUUIDValueException
import org.clinic.exception.ResourceNotFoundException
import org.springframework.context.MessageSource
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.http.converter.HttpMessageNotReadableException
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import java.util.Locale

@ControllerAdvice
class RestExceptionHandler(
    private val messageSource: MessageSource
) {
    @ExceptionHandler(IllegalUUIDValueException::class)
    fun handleBadRequestException(ex: IllegalUUIDValueException, locale: Locale): ResponseEntity<ApiErrorDto> =
        createResponseEntity(HttpStatus.BAD_REQUEST, ex, locale)

    @ExceptionHandler(
        ResourceNotFoundException::class,
        HttpMessageNotReadableException::class
    )
    fun handleNotFoundException(ex: ResourceNotFoundException, locale: Locale): ResponseEntity<ApiErrorDto> =
        createResponseEntity(HttpStatus.NOT_FOUND, ex, locale)

    @ExceptionHandler(MethodArgumentNotValidException::class)
    fun handleMethodArgumentNotValidException(ex: MethodArgumentNotValidException, locale: Locale): ResponseEntity<ApiErrorDto> =
        ResponseEntity
            .badRequest()
            .body(
                ApiErrorDto(
                    getExceptionMessage(ex, locale),
                    fieldErrors = ex.bindingResult.fieldErrors
                        .map { it.field to it.defaultMessage.toString() }
                        .toMap()
                )
            )

    private fun createResponseEntity(httpStatus: HttpStatus, ex: Exception, locale: Locale) =
        ResponseEntity
            .status(httpStatus)
            .body(createApiErrorDto(ex, locale))

    private fun createApiErrorDto(ex: Exception, locale: Locale) =
        ApiErrorDto(getExceptionMessage(ex, locale))

    private fun getExceptionMessage(ex: Exception, locale: Locale) =
        messageSource.getMessage(ex::class.simpleName + ".message", null, locale)
}
