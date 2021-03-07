package org.clinic.apiservice

import org.clinic.dto.patient.CreatePatientDto
import org.clinic.dto.patient.PatientDto

interface PatientApiService {
    fun getPatient(id: String): PatientDto

    fun createPatient(createPatientDto: CreatePatientDto): PatientDto

    fun updatePatient(id: String, createPatientDto: CreatePatientDto): PatientDto

    fun deletePatient(id: String)
}
