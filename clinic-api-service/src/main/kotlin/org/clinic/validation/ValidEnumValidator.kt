package org.clinic.validation

import javax.validation.ConstraintValidator
import javax.validation.ConstraintValidatorContext

class ValidEnumValidator : ConstraintValidator<ValidEnum, String?> {

    private lateinit var enumValues: Array<out Enum<*>>

    override fun initialize(constraintAnnotation: ValidEnum) {
        super.initialize(constraintAnnotation)
        enumValues = constraintAnnotation.enumClass.java.enumConstants
    }

    override fun isValid(value: String?, context: ConstraintValidatorContext?): Boolean =
        enumValues.any { enum -> enum.name == value }
}
