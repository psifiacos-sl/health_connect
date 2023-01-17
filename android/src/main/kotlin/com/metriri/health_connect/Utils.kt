import android.annotation.SuppressLint
import androidx.health.connect.client.impl.converters.datatype.toDataTypeKClass
import androidx.health.connect.client.impl.converters.datatype.toDataTypeName
import androidx.health.connect.client.impl.converters.permission.toProtoPermission
import androidx.health.connect.client.permission.AccessType
import androidx.health.connect.client.permission.AccessTypes
import androidx.health.connect.client.permission.HealthPermission
import com.metriri.health_connect.Constants

class Utils {
    companion object {

        fun fromListStringToRecordClass(list: List<String>): Set<Constants.RecordClass> {
            val result: MutableSet<Constants.RecordClass> = mutableSetOf()
            list.forEach {
                result.add(fromStringToRecordClass(it))
            }
            return result
        }

        fun fromStringToRecordClass(value: String): Constants.RecordClass {
            return Constants.RecordClass.valueOf(value)
        }

        @SuppressLint("RestrictedApi")
        fun fromPermissionsToRecordClasses(permissions: Set<HealthPermission>): Set<Constants.RecordClass> {
            val recordClasses: MutableSet<Constants.RecordClass> = mutableSetOf()
            permissions.forEach {
                val protoPermission = it.toProtoPermission()
                val name =
                    "${protoPermission.dataType.name}${
                        when (protoPermission.accessType.number) {
                            1 -> Constants.readSuffix
                            else -> Constants.writeSuffix
                        }
                    }"
                val recordClass = Constants.RecordClass.valueOf(name)
                recordClasses.add(recordClass)
            }
            return recordClasses
        }

        fun fromRecordClassesToPermissions(recordsClasses: List<String>): Set<HealthPermission> {
            val permissions: MutableSet<HealthPermission> = mutableSetOf()
            recordsClasses.forEach { str ->
                Constants.RecordClass.valueOf(str).kC.also { kClass ->
                    when (str.endsWith(Constants.readSuffix)) {
                        true -> permissions.add(HealthPermission.createReadPermission(kClass))
                        else -> permissions.add(HealthPermission.createWritePermission(kClass))
                    }
                }
            }
            return permissions
        }

    }


}