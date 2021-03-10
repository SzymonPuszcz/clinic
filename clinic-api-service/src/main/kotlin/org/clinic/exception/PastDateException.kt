package org.clinic.exception

import org.springframework.http.HttpStatus

class PastDateException : ApiException(HttpStatus.BAD_REQUEST)
