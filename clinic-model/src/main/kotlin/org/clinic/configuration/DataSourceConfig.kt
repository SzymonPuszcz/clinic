package org.clinic.configuration

import org.clinic.datasource.TenantAwareRoutingDataSource
import org.clinic.tenant.TenantContext
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import javax.sql.DataSource

@Configuration
class DataSourceConfig {
    @Bean
    fun getDataSource(dataSourceProperties: TenantsProperties, tenantContext: TenantContext): DataSource =
        TenantAwareRoutingDataSource(tenantContext).apply {
            setTargetDataSources(dataSourceProperties.dataSources)
            afterPropertiesSet()
        }
}
