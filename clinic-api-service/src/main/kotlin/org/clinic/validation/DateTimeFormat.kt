package org.clinic.validation

import javax.validation.Constraint
import javax.validation.Payload
import kotlin.reflect.KClass

@Suppress("unused")
@Target(
    AnnotationTarget.FIELD,
    AnnotationTarget.CONSTRUCTOR,
    AnnotationTarget.PROPERTY,
    AnnotationTarget.PROPERTY_GETTER
)
@Retention(AnnotationRetention.RUNTIME)
@Constraint(validatedBy = [DateTimeFormatValidator::class])
annotation class DateTimeFormat(
    val pattern: String,

    val message: String = "{org.clinic.validation.DateTimeFormat.message}",

    val groups: Array<KClass<*>> = [],

    val payload: Array<KClass<out Payload>> = []
)
