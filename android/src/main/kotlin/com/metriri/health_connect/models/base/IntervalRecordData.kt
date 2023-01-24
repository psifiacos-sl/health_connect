package com.metriri.health_connect.models.base

internal interface IntervalRecordData : RecordData {
    val startTime: Long
    val endTime: Long
    val startZoneOffset: Int
    val endZoneOffset: Int
}