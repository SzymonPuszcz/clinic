package org.clinic.ext

import org.clinic.exception.IllegalUUIDValueException
import java.lang.IllegalArgumentException
import java.util.UUID

fun String.toUUID(): UUID = try {
    UUID.fromString(this)
} catch (ex: IllegalArgumentException) {
    throw IllegalUUIDValueException()
}
