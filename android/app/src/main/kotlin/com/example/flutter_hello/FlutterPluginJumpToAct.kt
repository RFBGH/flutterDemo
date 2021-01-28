package com.example.flutter_hello

import android.app.Activity
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class FlutterPluginJumpToAct(val activity:Activity) :MethodChannel.MethodCallHandler{

    companion object{
        val CHANNEL = "com.jzhu.jump/plugin"
        lateinit var channel:MethodChannel
        
        fun registerWith(activity: Activity, messenger: BinaryMessenger){
            channel = MethodChannel(messenger, CHANNEL)
            val instance = FlutterPluginJumpToAct(activity)
            channel.setMethodCallHandler(instance)
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        if(call.method == "oneAct"){
            OneActivity.start(activity)
            result.success("is ok")
        }else if(call.method == "twoAct"){
            val text = call.argument<String>("flutter")
            TwoActivity.start(activity, text!!)
            result.success("is ok")
        }
    }
}