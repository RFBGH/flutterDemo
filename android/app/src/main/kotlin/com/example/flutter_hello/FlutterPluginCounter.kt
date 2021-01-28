package com.example.flutter_hello

import android.os.Handler
import android.os.Looper
import android.util.Log
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel

class FlutterPluginCounter :EventChannel.StreamHandler{

    companion object{

        val CHANNEL = "com.jzhu.counter/plugin"
        lateinit var channel: EventChannel
        fun register(messenger: BinaryMessenger){
            channel = EventChannel(messenger, CHANNEL)
            val instance = FlutterPluginCounter()
            channel.setStreamHandler(instance)
        }
    }

    var isCancel = false
    var count = 0
    val handler = Handler(Looper.getMainLooper())

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        isCancel = false
        Thread(){
            kotlin.run {
                while (!isCancel){
                    handler.post {
                        events?.success(count++)
                    }
                    Thread.sleep(1000)
                }
            }
        }.start()
    }

    override fun onCancel(arguments: Any?) {
        Log.e("flypig", "cancel");
        isCancel = true
    }
}