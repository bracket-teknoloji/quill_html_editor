package com.bracket23.picker

import androidx.annotation.NonNull
import com.bracket25.sewoo.Sewoo
import com.sewoo.jpos.printer.CPCLPrinter
import com.sewoo.jpos.printer.ESCPOSPrinter
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        println("Configuring Flutter Engine " + flutterEngine.dartExecutor.binaryMessenger.toString())
        Sewoo.setUp(flutterEngine.dartExecutor.binaryMessenger, SewooPrinter(), "SEWOO_ANDROID");
    }

}

class SewooPrinter : Sewoo {

    val printer = ESCPOSPrinter()
    override fun openPort(): Boolean {
        return true
    }

    override fun closePort(): Boolean {
        return true
    }

    override fun printText(text: String, callback: (Result<Boolean>) -> Unit) {
        printer.printText(text, 1,1,1)
        callback(Result.success(true))
    }

    override fun printImage(image: List<Long>, callback: (Result<Boolean>) -> Unit) {
        callback(Result.success(true))
    }

    override fun printPDF(pdfData: List<Long>, width: Long, height: Long, callback: (Result<Boolean>) -> Unit) {
        callback(Result.success(true))
    }
}