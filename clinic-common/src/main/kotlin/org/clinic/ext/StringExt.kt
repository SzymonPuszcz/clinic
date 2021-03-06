package org.clinic.ext

import org.clinic.exception.IllegalUUIDValue
import java.lang.IllegalArgumentException
import java.util.UUID

fun String.toUUID(): UUID = try {
    UUID.fromString(this)
} catch (ex: IllegalArgumentException) {
    throw IllegalUUIDValue()
}
