package org.clinic.dto.doctor

import org.clinic.annotation.Dto
import org.clinic.constants.ValidationConst.DEFAULT_MAX_SIZE
import org.clinic.model.enum.Specialisation
import org.clinic.validation.ValidEnum
import javax.validation.constraints.NotBlank
import javax.validation.constraints.Size

@Dto
data class CreateDoctorDto(
    @field:NotBlank
    @field:Size(max = DEFAULT_MAX_SIZE)
    var firstName: String,

    @field:NotBlank
    @field:Size(max = DEFAULT_MAX_SIZE)
    var lastName: String,

    @field:ValidEnum(enumClass = Specialisation::class)
    var specialisation: String
)
