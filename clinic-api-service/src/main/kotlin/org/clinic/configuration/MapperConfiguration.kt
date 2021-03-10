package org.clinic.configuration

import org.clinic.constants.ValidationConst
import org.modelmapper.Converter
import org.modelmapper.ModelMapper
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

@Configuration
class MapperConfiguration {

    @Bean
    fun modelMapper(): ModelMapper = ModelMapper().apply {
        addConverter(
            Converter<String, LocalDateTime> {
                LocalDateTime.parse(
                    it.source,
                    DateTimeFormatter.ofPattern(ValidationConst.DATE_YYYY_MM_DD_HH_MM_FORMAT)
                )
            }
        )
        addConverter(
            Converter<LocalDateTime, String> {
                it.source.format(DateTimeFormatter.ofPattern(ValidationConst.DATE_YYYY_MM_DD_HH_MM_FORMAT))
            }
        )
    }
}
