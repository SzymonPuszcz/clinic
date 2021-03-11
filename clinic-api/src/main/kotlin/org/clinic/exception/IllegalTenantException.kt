package org.clinic.exception

import org.springframework.http.HttpStatus

class IllegalTenantException : ApiException(HttpStatus.BAD_REQUEST)
