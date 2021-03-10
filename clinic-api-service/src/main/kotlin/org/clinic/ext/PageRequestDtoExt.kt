package org.clinic.ext

import org.clinic.dto.page.PageRequestDto
import org.springframework.data.domain.PageRequest
import org.springframework.data.domain.Pageable
import org.springframework.data.domain.Sort

fun PageRequestDto.toPageable(): Pageable {
    val sortBy = if (sort.isNotEmpty())
        Sort.by(sort.map { Sort.Order.asc(it) })
    else
        Sort.unsorted()
    return PageRequest.of(page, size, sortBy)
}
