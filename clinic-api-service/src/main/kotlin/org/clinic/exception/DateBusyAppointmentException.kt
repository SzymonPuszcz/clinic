package org.clinic.exception

import org.springframework.http.HttpStatus

class DateBusyAppointmentException : ApiException(HttpStatus.BAD_REQUEST)
