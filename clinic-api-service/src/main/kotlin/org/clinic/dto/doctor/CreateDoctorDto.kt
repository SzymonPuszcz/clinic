package org.clinic.dto.doctor

import org.clinic.annotation.Dto
import org.clinic.constants.ValidationConst.DEFAULT_MAX_SIZE
import org.clinic.model.enum.Specialisation
import org.clinic.validation.ValidEnum
import javax.validation.constraints.NotBlank
import javax.validation.constraints.Size

@Dto
data class CreateDoctorDto(
    @get:NotBlank(message = "firstName.notBlank")
    @get:Size(max = DEFAULT_MAX_SIZE)
    var firstName: String,

    @get:NotBlank(message = "{lastName.notBlank}")
    @get:Size(max = DEFAULT_MAX_SIZE)
    var lastName: String,

    @get:ValidEnum(enumClass = Specialisation::class, message = "{specialisation.validEnum}")
    var specialisation: String
)
