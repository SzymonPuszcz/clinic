package org.clinic.configuration

import org.springframework.boot.context.properties.ConstructorBinding

@ConstructorBinding
data class TenantDbProperties(
    val jdbcUrl: String,
    val driverClassName: String,
    val username: String,
    val password: String
)
