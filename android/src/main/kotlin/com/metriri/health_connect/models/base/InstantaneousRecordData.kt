package com.metriri.health_connect.models.base

internal interface InstantaneousRecordData : RecordData {
    val time: Long
    val zoneOffset: Int
}