package org.clinic.exception

import org.springframework.http.HttpStatus

class IllegalAppointmentValueException : ApiException(HttpStatus.BAD_REQUEST)
