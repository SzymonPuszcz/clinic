package org.clinic.resolver

import org.clinic.dto.page.PageRequestDto
import org.clinic.exception.IllegalParamException
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties
import org.springframework.core.MethodParameter
import org.springframework.stereotype.Component
import org.springframework.web.bind.support.WebDataBinderFactory
import org.springframework.web.context.request.NativeWebRequest
import org.springframework.web.method.support.HandlerMethodArgumentResolver
import org.springframework.web.method.support.ModelAndViewContainer

@Component
class PageRequestDtoResolver(
    private val springDataWebProperties: SpringDataWebProperties
) : HandlerMethodArgumentResolver {
    override fun supportsParameter(parameter: MethodParameter) =
        parameter.parameterType == PageRequestDto::class.java

    override fun resolveArgument(
        parameter: MethodParameter,
        mavContainer: ModelAndViewContainer?,
        webRequest: NativeWebRequest,
        binderFactory: WebDataBinderFactory?
    ): Any? = try {
        springDataWebProperties.run {
            val page = webRequest.getParameter(pageable.pageParameter)?.toInt()
                ?: 0
            val size = webRequest.getParameter(pageable.sizeParameter)?.toInt()
                ?: pageable.defaultPageSize
            val sort: List<String> = webRequest.getParameter(sort.sortParameter)
                ?.split(",")
                ?.filter { it.isNotBlank() }
                ?: emptyList()
            PageRequestDto(page, size, sort)
        }
    } catch (ex: NumberFormatException) {
        throw IllegalParamException()
    }
}
