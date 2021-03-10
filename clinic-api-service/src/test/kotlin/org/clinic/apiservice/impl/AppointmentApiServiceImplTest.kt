package org.clinic.apiservice.impl

import com.ninjasquad.springmockk.MockkBean
import io.kotest.assertions.throwables.shouldThrow
import io.kotest.core.spec.style.StringSpec
import io.kotest.spring.SpringListener
import io.mockk.every
import io.mockk.mockk
import io.mockk.mockkStatic
import io.mockk.verify
import org.clinic.apiservice.AppointmentApiService
import org.clinic.dto.appointment.CreateAppointmentDto
import org.clinic.exception.DateBusyAppointmentException
import org.clinic.exception.IllegalAppointmentValueException
import org.clinic.exception.PastDateException
import org.clinic.exception.ResourceNotFoundException
import org.clinic.ext.toUUID
import org.clinic.mapper.AppointmentMapper
import org.clinic.model.Appointment
import org.clinic.model.Doctor
import org.clinic.model.Patient
import org.clinic.service.AppointmentService
import org.clinic.service.DoctorService
import org.clinic.service.PatientService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import java.time.LocalDateTime
import java.util.UUID

@SpringBootTest(classes = [AppointmentApiServiceImpl::class])
class AppointmentApiServiceImplTest : StringSpec() {
    @Autowired
    private lateinit var appointmentApiService: AppointmentApiService

    @MockkBean
    private lateinit var appointmentService: AppointmentService

    @MockkBean
    private lateinit var doctorService: DoctorService

    @MockkBean
    private lateinit var patientService: PatientService

    @MockkBean
    private lateinit var appointmentMapper: AppointmentMapper

    init {
        "Should load context correctly" {
        }

        "Should throw IllegalAppointmentValueException when createAppointment and doctor does not exist" {
            shouldThrow<IllegalAppointmentValueException> {
                val createAppointmentDto = generateCreateAppointmentDto()
                every { doctorService.getDoctor(eq(createAppointmentDto.doctorId.toUUID())) } throws ResourceNotFoundException()

                appointmentApiService.createAppointment(createAppointmentDto)
            }
        }

        "Should throw IllegalAppointmentValueException when createAppointment and patient does not exist" {
            shouldThrow<IllegalAppointmentValueException> {
                val createAppointmentDto = generateCreateAppointmentDto()
                every { doctorService.getDoctor(eq(createAppointmentDto.doctorId.toUUID())) } returns mockk()
                every { patientService.getPatient(eq(createAppointmentDto.patientId.toUUID())) } throws ResourceNotFoundException()

                appointmentApiService.createAppointment(createAppointmentDto)
            }
        }

        "Should throw PastDateException when createAppointment with starDate from past" {
            shouldThrow<PastDateException> {
                val createAppointmentDto = generatePastCreateAppointmentDto()
                mockDoctorCorrectly(createAppointmentDto)
                mockPatientCorrectly(createAppointmentDto)
                mockLocalDateTimeNow()
                every { appointmentMapper.map(eq(createAppointmentDto), any(), any()) } returns mockk {
                    every { startDate } returns PAST_DATE
                }

                appointmentApiService.createAppointment(createAppointmentDto)
            }
        }

        "Should throw DateBusyAppointmentException when createAppointment with already taken startDate" {
            shouldThrow<DateBusyAppointmentException> {
                val createAppointmentDto = generateCreateAppointmentDto()
                val doctorMock = mockDoctorCorrectly(createAppointmentDto)
                mockPatientCorrectly(createAppointmentDto)
                mockLocalDateTimeNow()
                every { appointmentMapper.map(eq(createAppointmentDto), any(), any()) } returns mockk {
                    every { startDate } returns CORRECT_DATE
                    every { doctor } returns doctorMock
                }
                every { appointmentService.exists(eq(doctorMock), eq(CORRECT_DATE)) } returns true

                appointmentApiService.createAppointment(createAppointmentDto)
            }
        }

        "Should correctly save Appointment when createAppointment with correct createAppointmentDto" {
            val createAppointmentDto = generateCreateAppointmentDto()
            val doctorMock = mockDoctorCorrectly(createAppointmentDto)
            mockPatientCorrectly(createAppointmentDto)
            mockLocalDateTimeNow()
            val appointmentMock = mockk<Appointment> {
                every { startDate } returns CORRECT_DATE
                every { doctor } returns doctorMock
            }
            every { appointmentMapper.map(eq(createAppointmentDto), any(), any()) } returns appointmentMock
            every { appointmentService.exists(eq(doctorMock), eq(CORRECT_DATE)) } returns false
            every { appointmentService.saveAppointment(any()) } returnsArgument 0
            every { appointmentMapper.map(any()) } returns mockk()

            appointmentApiService.createAppointment(createAppointmentDto)

            verify(exactly = 1) { appointmentService.saveAppointment(eq(appointmentMock)) }
        }

        "Should throw PastDateException when updateAppointment with starDate from past" {
            shouldThrow<PastDateException> {
                val appointmentMock = mockk<Appointment> {
                    every { startDate } returns PAST_DATE
                }
                every { appointmentService.getAppointment(any()) } returns appointmentMock
                every { appointmentMapper.update(any(), any()) } returns Unit
                mockLocalDateTimeNow()

                appointmentApiService.updateAppointment(UUID.randomUUID().toString(), mockk())
            }
        }

        "Should throw DateBusyAppointmentException when updateAppointment with already taken startDate" {
            shouldThrow<DateBusyAppointmentException> {
                val appointmentMock = mockk<Appointment> {
                    every { startDate } returns CORRECT_DATE
                    every { doctor } returns mockk()
                }
                every { appointmentService.getAppointment(any()) } returns appointmentMock
                every { appointmentMapper.update(any(), any()) } returns Unit
                mockLocalDateTimeNow()
                every { appointmentService.exists(any(), eq(CORRECT_DATE)) } returns true

                appointmentApiService.updateAppointment(UUID.randomUUID().toString(), mockk())
            }
        }

        "Should save Appointment when updateAppointment with correct UpdateAppointmentDto" {
            val appointmentMock = mockk<Appointment> {
                every { startDate } returns CORRECT_DATE
                every { doctor } returns mockk()
            }
            every { appointmentService.getAppointment(any()) } returns appointmentMock
            every { appointmentMapper.update(any(), any()) } returns Unit
            mockLocalDateTimeNow()
            every { appointmentService.exists(any(), eq(CORRECT_DATE)) } returns false
            every { appointmentService.saveAppointment(any()) } returnsArgument 0
            every { appointmentMapper.map(any()) } returns mockk()

            appointmentApiService.updateAppointment(UUID.randomUUID().toString(), mockk())

            verify(exactly = 1) { appointmentService.saveAppointment(eq(appointmentMock)) }
        }
    }

    override fun listeners() = listOf(SpringListener)

    private fun mockDoctorCorrectly(createAppointmentDto: CreateAppointmentDto) =
        mockk<Doctor>().also {
            every { doctorService.getDoctor(eq(createAppointmentDto.doctorId.toUUID())) } returns it
        }

    private fun mockPatientCorrectly(createAppointmentDto: CreateAppointmentDto) =
        mockk<Patient>().also {
            every { patientService.getPatient(eq(createAppointmentDto.patientId.toUUID())) } returns it
        }

    private fun mockLocalDateTimeNow() {
        mockkStatic(LocalDateTime::class)
        every { LocalDateTime.now() } returns NOW
    }

    private fun generateCreateAppointmentDto() =
        CreateAppointmentDto(UUID.randomUUID().toString(), UUID.randomUUID().toString(), "2020-03-08 15:00", "Warsaw")

    private fun generatePastCreateAppointmentDto() =
        CreateAppointmentDto(UUID.randomUUID().toString(), UUID.randomUUID().toString(), "2020-03-08 10:00", "Warsaw")

    companion object {
        private val PAST_DATE = LocalDateTime.of(2020, 3, 8, 10, 0)

        private val NOW = LocalDateTime.of(2020, 3, 8, 12, 0)

        private val CORRECT_DATE = LocalDateTime.of(2020, 3, 8, 15, 0)
    }
}
