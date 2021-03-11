package org.clinic.configuration

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.boot.jdbc.DataSourceBuilder
import org.springframework.stereotype.Component

@Component
@ConfigurationProperties(prefix = "tenants")
class TenantsProperties {
    var databases: MutableMap<String, TenantDbProperties> = mutableMapOf()

    val dataSources: Map<Any, Any>
        get() =
            databases.mapValues {
                it.value.run {
                    DataSourceBuilder.create()
                        .url(jdbcUrl)
                        .username(username)
                        .password(password)
                        .driverClassName(driverClassName)
                        .build()
                }
            }
}
