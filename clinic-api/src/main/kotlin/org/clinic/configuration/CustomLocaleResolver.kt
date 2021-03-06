package org.clinic.configuration

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.support.ReloadableResourceBundleMessageSource
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean
import org.springframework.validation.beanvalidation.MethodValidationPostProcessor
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver

@Configuration
class CustomLocaleResolver : AcceptHeaderLocaleResolver(), WebMvcConfigurer {
    @Bean
    override fun getValidator(): LocalValidatorFactoryBean =
        LocalValidatorFactoryBean().apply {
            setValidationMessageSource(messageSource())
        }

    @Bean
    fun messageSource(): ReloadableResourceBundleMessageSource =
        ReloadableResourceBundleMessageSource().apply {
            setBasename("classpath:messages")
            setDefaultEncoding("UTF-8")
            setUseCodeAsDefaultMessage(true)
        }

    @Bean
    fun methodValidationPostProcessor(): MethodValidationPostProcessor? {
        return MethodValidationPostProcessor()
    }
}
