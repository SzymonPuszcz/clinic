package org.clinic.controller

import org.clinic.apiservice.PatientApiService
import org.clinic.dto.patient.CreatePatientDto
import org.clinic.dto.patient.PatientDto
import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestController
import javax.validation.Valid

@RestController
@RequestMapping("/patient")
class PatientController(
    private val patientApiService: PatientApiService
) {
    @GetMapping("{id}")
    fun getPatient(@PathVariable id: String): PatientDto = patientApiService.getPatient(id)

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createPatient(@Valid @RequestBody createPatientDto: CreatePatientDto): PatientDto =
        patientApiService.createPatient(createPatientDto)

    @PutMapping("{id}")
    fun updatePatient(@PathVariable id: String, @Valid @RequestBody createPatientDto: CreatePatientDto): PatientDto =
        patientApiService.updatePatient(id, createPatientDto)

    @DeleteMapping("{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deletePatient(@PathVariable id: String) = patientApiService.deletePatient(id)
}
