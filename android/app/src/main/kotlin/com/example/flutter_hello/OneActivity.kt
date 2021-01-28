package com.example.flutter_hello

import android.app.Activity
import android.content.Intent
import android.os.Bundle

class OneActivity : Activity() {
    
    companion object{
        fun start(activity :Activity){
            val it = Intent(activity, OneActivity::class.java)
            activity.startActivity(it)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        setContentView(R.layout.activity_one)
    }
    
}