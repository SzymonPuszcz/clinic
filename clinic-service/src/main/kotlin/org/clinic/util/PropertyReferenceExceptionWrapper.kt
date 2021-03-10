package org.clinic.util

import org.clinic.exception.IllegalPropertyException
import org.springframework.data.domain.Page
import org.springframework.data.mapping.PropertyReferenceException

inline fun <T> propertyReferenceExceptionWrapper(block: () -> Page<T>): Page<T> =
    try {
        block.invoke()
    } catch (ex: PropertyReferenceException) {
        throw IllegalPropertyException()
    }
