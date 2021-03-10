package org.clinic.validation

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException
import javax.validation.ConstraintValidator
import javax.validation.ConstraintValidatorContext

class DateTimeFormatValidator : ConstraintValidator<DateTimeFormat, String?> {

    private lateinit var pattern: String

    override fun initialize(constraintAnnotation: DateTimeFormat) {
        super.initialize(constraintAnnotation)
        pattern = constraintAnnotation.pattern
    }

    override fun isValid(value: String?, context: ConstraintValidatorContext?): Boolean =
        try {
            LocalDateTime.parse(value, DateTimeFormatter.ofPattern(pattern))
            true
        } catch (ex: DateTimeParseException) {
            false
        }
}
