package org.clinic.filter

import org.clinic.exception.IllegalTenantException
import org.clinic.tenant.TenantContext
import org.clinic.util.TenantValidator
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.stereotype.Component
import org.springframework.web.filter.OncePerRequestFilter
import org.springframework.web.servlet.HandlerExceptionResolver
import javax.servlet.FilterChain
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Component
class TenantIdentificationFilter(
    private val tenantContext: TenantContext,
    private val tenantValidator: TenantValidator,
    @Qualifier("handlerExceptionResolver")
    private val resolver: HandlerExceptionResolver
) : OncePerRequestFilter() {

    override fun doFilterInternal(request: HttpServletRequest, response: HttpServletResponse, filterChain: FilterChain) {
        try {
            val tenant = request.getHeader("tenant")

            if (!tenantValidator.isValid(tenant))
                throw IllegalTenantException()

            tenantContext.tenantId = tenant

            filterChain.doFilter(request, response)
        } catch (ex: IllegalTenantException) {
            resolver.resolveException(request, response, null, ex)
        }
    }
}
