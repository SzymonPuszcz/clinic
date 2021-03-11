package org.clinic.configuration

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.stereotype.Component

@Component
@ConfigurationProperties("tenants")
class TenantConfigurationProperties(
    val databases: Map<String, Any>
)
