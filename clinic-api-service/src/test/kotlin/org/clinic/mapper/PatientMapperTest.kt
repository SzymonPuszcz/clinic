package org.clinic.mapper

import io.kotest.core.spec.style.StringSpec
import io.kotest.matchers.equality.shouldBeEqualToIgnoringFields
import io.kotest.matchers.shouldBe
import io.kotest.spring.SpringListener
import org.clinic.dto.patient.CreatePatientDto
import org.clinic.dto.patient.PatientDto
import org.clinic.model.Patient
import org.clinic.utils.createFaker
import org.modelmapper.ModelMapper
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import java.util.UUID

@SpringBootTest(classes = [PatientMapper::class, ModelMapper::class])
class PatientMapperTest : StringSpec() {
    override fun listeners() = listOf(SpringListener)

    private val faker = createFaker()

    @Autowired
    private lateinit var patientMapper: PatientMapper

    init {
        "Should map Patient entity to PatientDto correctly" {
            generatePatient().let {

                val patientDto = patientMapper.map(it)

                val expected = PatientDto(it.id.toString(), it.firstName, it.lastName, it.address)
                patientDto shouldBe expected
            }
        }

        "Should map CreatePatientDto to Patient entity correctly" {
            generateCreatePatientDto().let {

                val patient = patientMapper.map(it)

                val expected = Patient(UUID.randomUUID(), it.firstName, it.lastName, it.address)
                patient.shouldBeEqualToIgnoringFields(expected, Patient::id)
            }
        }

        "Should update Patient with CreatePatientDto properties correctly" {
            generateCreatePatientDto().let {
                val patient = generatePatient()

                patientMapper.map(it, patient)

                val expected = Patient(patient.id, it.firstName, it.lastName, it.address)
                patient shouldBe expected
            }
        }
    }

    private fun generatePatient(): Patient =
        Patient(UUID.randomUUID(), faker.name.firstName(), faker.name.lastName(), faker.address.fullAddress())

    private fun generateCreatePatientDto(): CreatePatientDto =
        CreatePatientDto(faker.name.firstName(), faker.name.lastName(), faker.address.fullAddress())
}
