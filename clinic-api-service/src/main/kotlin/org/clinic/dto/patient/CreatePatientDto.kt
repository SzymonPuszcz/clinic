package org.clinic.dto.patient

import org.clinic.annotation.Dto
import org.clinic.constants.ValidationConst
import javax.validation.constraints.NotBlank
import javax.validation.constraints.Size

@Dto
data class CreatePatientDto(
    @field:NotBlank(message = "firstName.notBlank")
    @field:Size(max = ValidationConst.DEFAULT_MAX_SIZE)
    var firstName: String,

    @field:NotBlank(message = "{lastName.notBlank}")
    @field:Size(max = ValidationConst.DEFAULT_MAX_SIZE)
    var lastName: String,

    @field:NotBlank(message = "{address.notBlank}")
    @field:Size(max = ValidationConst.DEFAULT_MAX_SIZE)
    var address: String
)
