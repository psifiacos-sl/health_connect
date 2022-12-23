import androidx.health.connect.client.permission.HealthPermission
import androidx.health.connect.client.records.HeartRateRecord
import com.metriri.health_connect.Constants

class Utils {
    companion object {
        fun fromRecordClassesToPermissions(recordsClasses: List<Constants.RecordClass> ): Set<HealthPermission>{
            val permissions : Set<HealthPermission> = setOf()
            recordsClasses.forEach {
                when(it){
                    Constants.RecordClass.StepsRecord -> {
                        permissions.plusElement(HealthPermission.createReadPermission(HeartRateRecord::class))
                    }
                    else -> {

                    }
                }
            }
            return permissions
        }
    }


}