package com.example.flutter_hello

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.widget.TextView

class TwoActivity : Activity() {
    
    companion object{

        val KEY_TEXT = "text"

        fun start(activity :Activity, text:String){
            val it = Intent(activity, TwoActivity::class.java)
            it.putExtra(KEY_TEXT, text)
            activity.startActivity(it)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_two)
        findViewById<TextView>(R.id.tv_text).setText(intent.getStringExtra(KEY_TEXT))
    }
    
}