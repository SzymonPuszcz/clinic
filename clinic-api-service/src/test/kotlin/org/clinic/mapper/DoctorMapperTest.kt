package org.clinic.mapper

import io.kotest.core.spec.style.StringSpec
import io.kotest.matchers.equality.shouldBeEqualToIgnoringFields
import io.kotest.matchers.shouldBe
import io.kotest.spring.SpringListener
import org.clinic.dto.doctor.CreateDoctorDto
import org.clinic.dto.doctor.DoctorDto
import org.clinic.model.Doctor
import org.clinic.model.enum.Specialisation
import org.clinic.utils.createFaker
import org.modelmapper.ModelMapper
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import java.util.UUID

@SpringBootTest(classes = [DoctorMapper::class, ModelMapper::class])
class DoctorMapperTest : StringSpec() {
    private val faker = createFaker()

    @Autowired
    private lateinit var doctorMapper: DoctorMapper

    init {
        "Should map Doctor entity to DoctorDto correctly" {
            generateDoctor().let {

                val doctorDto = doctorMapper.map(it)

                val expected = DoctorDto(it.id.toString(), it.firstName, it.lastName, it.specialisation.name)
                doctorDto shouldBe expected
            }
        }

        "Should map CreateDoctorDto to Doctor entity correctly" {
            generateCreateDoctorDto().let {

                val doctor = doctorMapper.map(it)

                val expected = Doctor(UUID.randomUUID(), it.firstName, it.lastName, Specialisation.valueOf(it.specialisation))
                doctor.shouldBeEqualToIgnoringFields(expected, Doctor::id)
            }
        }

        "Should update Doctor with CreateDoctorDto properties correctly" {
            generateCreateDoctorDto().let {
                val doctor = generateDoctor()

                doctorMapper.map(it, doctor)

                val expected = Doctor(doctor.id, it.firstName, it.lastName, Specialisation.valueOf(it.specialisation))
                doctor shouldBe expected
            }
        }
    }

    override fun listeners() = listOf(SpringListener)

    private fun generateDoctor(): Doctor =
        Doctor(UUID.randomUUID(), faker.name.firstName(), faker.name.lastName(), Specialisation.DENTIST)

    private fun generateCreateDoctorDto(): CreateDoctorDto =
        CreateDoctorDto(faker.name.firstName(), faker.name.lastName(), "DENTIST")
}
