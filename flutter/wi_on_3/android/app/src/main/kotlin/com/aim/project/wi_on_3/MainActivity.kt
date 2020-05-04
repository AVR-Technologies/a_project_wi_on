package com.aim.project.wi_on_3

import android.annotation.TargetApi
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.net.wifi.WifiConfiguration
import android.net.wifi.WifiInfo
import android.net.wifi.WifiManager
import android.os.Build
import android.os.Bundle
import android.os.PersistableBundle
import android.text.format.Formatter
import android.util.Log
import android.widget.Toast
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.shinow.qrscan.CheckPermissionUtils
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugins.GeneratedPluginRegistrant.*
import java.io.IOException
import java.security.Permission
import java.security.Permissions
import java.util.jar.Manifest as Manifest

@Suppress("DEPRECATION", "UNCHECKED_CAST")
class MainActivity: FlutterActivity() {
    var wifiChannel = "com.settings.plugins/wifi"
    var permissionsChannel = "com.settings.plugins/permissions"

    lateinit var wifiManager : WifiManager
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        registerWith(flutterEngine)
        wifiManager = context?.getSystemService(Context.WIFI_SERVICE) as WifiManager
//        PermissionUtils().initPermission(activity)
        MethodChannel(flutterEngine!!.dartExecutor, wifiChannel).setMethodCallHandler{ call, result ->
            when (call.method) {
                "enable" -> {
                    enableWifi()
                    result.success("Wifi turned on")
                }
                "disable" -> {
                    disableWifi()
                    result.success("Wifi turned off")
                }
                "connect" -> {
                    try{
                        if(!isWifiEnable()) enableWifi()
                        val wifiSSID = call.argument<String>("wifiSSID")
                        val wifiPassword = call.argument<String>("wifiPassword")
                        wifiManager.apply {
                            WifiConfiguration().also {
                                it.apply {
                                    SSID = quoted(wifiSSID)
                                    status = WifiConfiguration.Status.ENABLED
                                    allowedPairwiseCiphers.set(WifiConfiguration.PairwiseCipher.CCMP)
                                    allowedPairwiseCiphers.set(WifiConfiguration.PairwiseCipher.TKIP)
                                    allowedGroupCiphers.set(WifiConfiguration.GroupCipher.WEP40)
                                    allowedGroupCiphers.set(WifiConfiguration.GroupCipher.WEP104)
                                    allowedGroupCiphers.set(WifiConfiguration.GroupCipher.CCMP)
                                    allowedGroupCiphers.set(WifiConfiguration.GroupCipher.TKIP)
                                    allowedProtocols.set(WifiConfiguration.Protocol.RSN)
                                    allowedProtocols.set(WifiConfiguration.Protocol.WPA)
                                    allowedKeyManagement.set(WifiConfiguration.KeyMgmt.WPA_PSK)
                                    allowedKeyManagement.set(WifiConfiguration.KeyMgmt.WPA_EAP)
                                    if( wifiPassword.isNullOrBlank() ){
                                        hiddenSSID = true
                                        allowedKeyManagement.set(WifiConfiguration.KeyMgmt.NONE)
                                        allowedAuthAlgorithms.clear()
                                        allowedAuthAlgorithms.set(WifiConfiguration.AuthAlgorithm.OPEN)
                                    } else {
                                        preSharedKey = quoted(wifiPassword)
                                        allowedKeyManagement.set(WifiConfiguration.KeyMgmt.WPA_PSK)
                                    }
                                }
                                val id = this.addNetwork(it)
                                this.disconnect()
                                this.enableNetwork(id, true)
                                this.reconnect()
                            }
                        }
//                    if(wifiSSID?.let { isConnectedTo(it) }!!) result.success(1)   // connected
//                    else result.success(0)                          // error or not connected
                        result.success(1)
                    }catch (e : IOException){
                        e.printStackTrace()
                        result.success(0)
                    }
                }
                "isConnectedTo" -> result.success(call.argument<String>("ssid")?.let { isConnectedTo(it) }?.let { booleanToInt(it) })
                "status" -> {
                    @Suppress("DEPRECATION")
                    when (call.argument<String>("of")){
                        "ssid" -> result.success(ssid())
                        "ip" -> result.success(ipAddress())
                        else -> result.success("nothing to do")
                    }
                }
                "disconnect" -> {
                    if(!isWifiEnable()) enableWifi()
                    wifiManager.disconnect()
                    result.success("disconnected")
                }
                else -> result.notImplemented()
            }
        }
        MethodChannel(flutterEngine!!.dartExecutor, permissionsChannel).setMethodCallHandler{call, result ->
            when(call.method) {
                "check" ->{

                }
                "request" ->{
                    val askPermissions : ArrayList<String> = call.arguments()
                    val mPermissions = arrayOfNulls<String>(askPermissions.size)
                    askPermissions.toArray(mPermissions)
                    lateinit var permissionsNotProvided : List<String>
                    ActivityCompat.requestPermissions(activity, mPermissions,100)
                    for(permission in askPermissions){
                    }
                    Toast.makeText(context, this.permissions[askPermissions[0]], Toast.LENGTH_SHORT).show()
                }
            }
        }
    }
    val permissions = mapOf<String, String>(
            "FineLocation" to android.Manifest.permission.ACCESS_FINE_LOCATION,
            "CoarseLocation" to android.Manifest.permission.ACCESS_COARSE_LOCATION,
            "ChangeWifi" to android.Manifest.permission.CHANGE_WIFI_STATE,
            "AccessWifi" to android.Manifest.permission.ACCESS_WIFI_STATE
    )
    private fun enableWifi(){ wifiManager.isWifiEnabled = true }
    private fun disableWifi(){ wifiManager.isWifiEnabled = false }
    private fun quoted(value : String?): String = "\"".plus(value).plus("\"")
    private fun isWifiEnable() = wifiManager.isWifiEnabled
    private fun isConnectedTo(wifiSSID : String) : Boolean = wifiSSID == ssid()
    private fun booleanToInt(success : Boolean) : Int = if (success) 1 else 0
    private fun ssid() = wifiManager.connectionInfo.ssid.split('"')[1]
    @TargetApi(Build.VERSION_CODES.CUPCAKE)
    private fun ipAddress() = Formatter.formatIpAddress(wifiManager.connectionInfo.ipAddress)
}
//class PermissionUtils {
//    fun initPermission(activity : Activity){
//        PermissionUtils().checkPermissions(activity).also{
//            if(it.size != 0) ActivityCompat.requestPermissions(activity, permissions, 100)
//        }
//    }
//    private var permissions = arrayOf(
//            android.Manifest.permission.ACCESS_COARSE_LOCATION,
//            android.Manifest.permission.ACCESS_FINE_LOCATION,
//            android.Manifest.permission.ACCESS_WIFI_STATE,
//            android.Manifest.permission.CHANGE_WIFI_STATE
//    )
//    private fun checkPermissions(context: Context) : ArrayList<String> = ArrayList<String>().apply{
//        for(permission in permissions){
//            ContextCompat.checkSelfPermission(context, permission).also {
//                if(it == PackageManager.PERMISSION_DENIED) this.add(permission)
//            }
//        }
//    }
//
//}