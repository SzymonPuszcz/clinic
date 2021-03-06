package org.clinic

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.context.properties.ConfigurationPropertiesScan
import org.springframework.boot.runApplication

@SpringBootApplication
@ConfigurationPropertiesScan
class ClinicApplication

fun main(args: Array<String>) {
    runApplication<ClinicApplication>(*args)
}
