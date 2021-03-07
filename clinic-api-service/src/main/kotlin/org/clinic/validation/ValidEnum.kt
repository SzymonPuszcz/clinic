package org.clinic.validation

import javax.validation.Constraint
import javax.validation.Payload
import kotlin.reflect.KClass

@Target(
    AnnotationTarget.FIELD,
    AnnotationTarget.CONSTRUCTOR,
    AnnotationTarget.PROPERTY,
    AnnotationTarget.PROPERTY_GETTER
)
@Retention(AnnotationRetention.RUNTIME)
@Constraint(validatedBy = [ValidEnumValidator::class])
annotation class ValidEnum(
    val enumClass: KClass<out Enum<*>>,

    val message: String = "{org.clinic.validation.ValidEnum.message}",

    val groups: Array<KClass<*>> = [],

    val payload: Array<KClass<out Payload>> = []
)
