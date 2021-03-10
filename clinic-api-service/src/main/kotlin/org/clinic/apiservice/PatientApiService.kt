package org.clinic.apiservice

import org.clinic.dto.page.PageRequestDto
import org.clinic.dto.page.PageResponseDto
import org.clinic.dto.patient.CreatePatientDto
import org.clinic.dto.patient.PatientDto

interface PatientApiService {
    fun getAllPatients(pageRequestDto: PageRequestDto): PageResponseDto<PatientDto>

    fun getPatient(id: String): PatientDto

    fun createPatient(createPatientDto: CreatePatientDto): PatientDto

    fun updatePatient(id: String, createPatientDto: CreatePatientDto): PatientDto

    fun deletePatient(id: String)
}
