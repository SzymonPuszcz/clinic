package org.clinic.configuration

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.support.ResourceBundleMessageSource
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver
import java.util.Locale
import javax.servlet.http.HttpServletRequest

@Configuration
class CustomLocaleResolver : AcceptHeaderLocaleResolver(), WebMvcConfigurer {
    override fun resolveLocale(request: HttpServletRequest): Locale {
        val headerLang = request.getHeader("Accept-Language")
        return if (headerLang.isNullOrEmpty())
            Locale.getDefault()
        else
            Locale.lookup(Locale.LanguageRange.parse(headerLang), LOCALES)
    }

    @Bean
    fun messageSource(): ResourceBundleMessageSource =
        ResourceBundleMessageSource().apply {
            setBasename("messages")
            setDefaultEncoding("UTF-8")
            setUseCodeAsDefaultMessage(true)
        }

    companion object {
        val LOCALES = listOf(
            Locale("en")
        )
    }
}
