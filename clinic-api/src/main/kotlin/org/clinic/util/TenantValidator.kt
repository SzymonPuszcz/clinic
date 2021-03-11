package org.clinic.util

import org.clinic.configuration.TenantConfigurationProperties
import org.springframework.stereotype.Service

@Service
class TenantValidator(
    private val tenantsConfigurationProperties: TenantConfigurationProperties
) {
    fun isValid(tenantId: String): Boolean = tenantsConfigurationProperties.databases.containsKey(tenantId)
}
