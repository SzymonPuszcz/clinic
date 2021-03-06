package org.clinic.controller

import org.clinic.apiservice.DoctorApiService
import org.clinic.dto.doctor.CreateDoctorDto
import org.clinic.dto.doctor.DoctorDto
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
@RequestMapping("/doctor")
class DoctorController(
    private val doctorApiService: DoctorApiService
) {
    @GetMapping("{id}")
    fun getDoctor(@PathVariable id: String): DoctorDto = doctorApiService.getDoctor(id)

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    fun createDoctor(@Valid @RequestBody createDoctorDto: CreateDoctorDto): DoctorDto =
        doctorApiService.createDoctor(createDoctorDto)

    @PutMapping("{id}")
    fun updateDoctor(@PathVariable id: String, @Valid @RequestBody createDoctorDto: CreateDoctorDto): DoctorDto =
        doctorApiService.updateDoctor(id, createDoctorDto)

    @DeleteMapping("{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    fun deleteDoctor(@PathVariable id: String) = doctorApiService.deleteDoctor(id)
}
