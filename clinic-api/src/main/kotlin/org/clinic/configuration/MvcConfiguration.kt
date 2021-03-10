package org.clinic.configuration

import org.clinic.resolver.PageRequestDtoResolver
import org.springframework.context.annotation.Configuration
import org.springframework.web.method.support.HandlerMethodArgumentResolver
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

@Configuration
class MvcConfiguration(
    private val pageRequestDtoResolver: PageRequestDtoResolver
) : WebMvcConfigurer {
    override fun addArgumentResolvers(resolvers: MutableList<HandlerMethodArgumentResolver>) {
        resolvers.add(pageRequestDtoResolver)
    }
}
