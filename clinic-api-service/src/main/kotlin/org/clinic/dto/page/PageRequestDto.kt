package org.clinic.dto.page

data class PageRequestDto(
    val page: Int,
    val size: Int,
    val sort: List<String>
)
