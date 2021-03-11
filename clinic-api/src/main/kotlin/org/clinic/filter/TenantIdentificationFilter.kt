package org.clinic.filter

import org.clinic.exception.IllegalTenantException
import org.clinic.tenant.TenantContext
import org.clinic.util.TenantValidator
import org.springframework.stereotype.Component
import org.springframework.web.filter.OncePerRequestFilter
import javax.servlet.FilterChain
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Component
class TenantIdentificationFilter(
    private val tenantContext: TenantContext,
    private val tenantValidator: TenantValidator
) : OncePerRequestFilter() {

    override fun doFilterInternal(request: HttpServletRequest, response: HttpServletResponse, filterChain: FilterChain) {
        val tenant = request.getHeader("tenant")

        if (!tenantValidator.isValid(tenant))
            throw IllegalTenantException()

        tenantContext.tenantId = tenant

        filterChain.doFilter(request, response)
    }
}
