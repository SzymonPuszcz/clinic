package org.clinic.dto.doctor

import org.clinic.annotation.Dto
import org.clinic.constants.ValidationConst.DEFAULT_MAX_SIZE
import javax.validation.constraints.NotBlank
import javax.validation.constraints.Size

@Dto
data class CreateDoctorDto(
    @NotBlank
    @Size(max = DEFAULT_MAX_SIZE)
    val firstName: String,

    @NotBlank
    @Size(max = DEFAULT_MAX_SIZE)
    val lastName: String,

    @NotBlank
    @Size(max = DEFAULT_MAX_SIZE)
    val address: String
)
