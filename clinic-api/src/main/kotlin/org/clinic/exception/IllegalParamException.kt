package org.clinic.exception

import org.springframework.http.HttpStatus

class IllegalParamException : ApiException(HttpStatus.BAD_REQUEST)
