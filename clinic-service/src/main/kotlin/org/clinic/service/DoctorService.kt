package org.clinic.service

import org.clinic.model.Doctor
import java.util.UUID

interface DoctorService {
    fun getDoctor(id: UUID): Doctor

    fun saveDoctor(doctor: Doctor): Doctor

    fun deleteDoctor(id: UUID)
}
