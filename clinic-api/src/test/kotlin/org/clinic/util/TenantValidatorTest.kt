package org.clinic.util

import com.ninjasquad.springmockk.MockkBean
import io.kotest.core.spec.style.StringSpec
import io.kotest.matchers.shouldBe
import io.kotest.spring.SpringListener
import io.mockk.every
import org.clinic.configuration.TenantConfigurationProperties
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest

@SpringBootTest(classes = [TenantValidator::class])
class TenantValidatorTest : StringSpec() {

    @MockkBean
    private lateinit var tenantConfigurationProperties: TenantConfigurationProperties

    @Autowired
    private lateinit var tenantValidator: TenantValidator

    init {
        "Should return false when isValid of not existing tenantId" {
            mockTenantPropertiesConfiguration()

            val isValid = tenantValidator.isValid("tenant3")

            isValid shouldBe false
        }

        "Should return true when isValid of  existing tenantId" {
            mockTenantPropertiesConfiguration()

            val isValid = tenantValidator.isValid("tenant1")

            isValid shouldBe true
        }
    }

    private fun mockTenantPropertiesConfiguration() {
        every { tenantConfigurationProperties.databases } returns mapOf("tenant1" to Any(), "tenant2" to Any())
    }

    override fun listeners() = listOf(SpringListener)
}
