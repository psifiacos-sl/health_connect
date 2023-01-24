package com.metriri.health_connect.models.base

internal interface SeriesRecordData<out T : Any> : IntervalRecordData {
    val samples: List<T>
}