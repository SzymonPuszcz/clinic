package org.clinic.tenant

/**
 * Context class for tenant. It has to be open class because of generating CGLIB subclass for request scope bean.
 */
open class TenantContext {
    var tenantId: String? = null
}
