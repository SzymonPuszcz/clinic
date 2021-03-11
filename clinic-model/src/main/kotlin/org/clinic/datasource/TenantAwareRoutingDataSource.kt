package org.clinic.datasource

import org.clinic.tenant.TenantContext
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource

class TenantAwareRoutingDataSource(
    private val tenantContext: TenantContext
) : AbstractRoutingDataSource() {
    override fun determineCurrentLookupKey(): String? {
        return tenantContext.tenantId
    }
}
