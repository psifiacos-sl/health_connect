import androidx.health.connect.client.permission.HealthPermission
import androidx.health.connect.client.records.HeartRateRecord
import com.metriri.health_connect.Constants

class Utils {
    companion object {
        fun fromListStringToRecordClass(list: List<String>): Set<Constants.RecordClass>{
            val result : MutableSet<Constants.RecordClass> = mutableSetOf()
            list.forEach {
                result.add(Constants.RecordClass.valueOf(it))
            }
            return  result
        }
        fun fromRecordClassesToPermissions(recordsClasses: Set<Constants.RecordClass> ): Set<HealthPermission>{
            val permissions : MutableSet<HealthPermission> = mutableSetOf()
            recordsClasses.forEach {
                when(it){
                    Constants.RecordClass.StepsRecord -> {
                        permissions.add(HealthPermission.createReadPermission(HeartRateRecord::class))
                    }
                    else -> {

                    }
                }
            }
            return permissions
        }
    }


}