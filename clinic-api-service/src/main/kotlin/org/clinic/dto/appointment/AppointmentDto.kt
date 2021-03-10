package org.clinic.dto.appointment

import org.clinic.annotation.Dto
import org.clinic.dto.doctor.DoctorDto
import org.clinic.dto.patient.PatientDto

@Dto
data class AppointmentDto(
    var id: String,

    var doctor: DoctorDto,

    var patient: PatientDto,

    var startDate: String,

    var location: String
)
