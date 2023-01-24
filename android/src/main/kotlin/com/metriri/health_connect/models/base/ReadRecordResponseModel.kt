package com.metriri.health_connect.models.base


data class ReadRecordResponseModel<T : Any>(
    val records: List<T> = listOf(),
    val pageToken: String? = null
)