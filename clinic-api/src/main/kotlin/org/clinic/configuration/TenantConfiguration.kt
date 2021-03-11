package org.clinic.configuration

import org.clinic.tenant.TenantContext
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.web.context.annotation.RequestScope

@Configuration
class TenantConfiguration {
    @Bean
    @RequestScope
    fun tenantContext() = TenantContext()
}
