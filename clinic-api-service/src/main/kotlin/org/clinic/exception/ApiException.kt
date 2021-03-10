package org.clinic.exception

import org.springframework.http.HttpStatus

abstract class ApiException(val httpStatus: HttpStatus) : RuntimeException()
