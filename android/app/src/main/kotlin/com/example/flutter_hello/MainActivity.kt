package com.example.flutter_hello

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        FlutterPluginJumpToAct.registerWith(this, flutterEngine!!.dartExecutor.binaryMessenger)
        FlutterPluginCounter.register(flutterEngine!!.dartExecutor.binaryMessenger)
    }
}
