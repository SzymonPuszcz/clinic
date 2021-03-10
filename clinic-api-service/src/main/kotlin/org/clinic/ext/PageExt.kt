package org.clinic.ext

import org.clinic.dto.page.PageResponseDto
import org.springframework.data.domain.Page

fun <T> Page<T>.toPageResponseDto() = PageResponseDto(hasNext(), hasPrevious(), totalPages, content)
