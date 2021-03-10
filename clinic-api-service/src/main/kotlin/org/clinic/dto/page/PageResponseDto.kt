package org.clinic.dto.page

data class PageResponseDto<T>(
    val hasNext: Boolean,
    val hasPrevious: Boolean,
    val totalPages: Int,
    val items: List<T>
)
