package com.bracket23.picker

import androidx.annotation.NonNull
import com.bracket25.sewoo.Sewoo
import com.sewoo.jpos.printer.CPCLPrinter
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
    override fun printText(text: String, callback: (Result<Boolean>) -> Unit) {
        println("Printing text: $text")
        // use CPCLPrinter and print the text on bluetooth printer
        val cpclPrinter: CPCLPrinter = CPCLPrinter()
        val data = "ABCDEFGHIJKLMNOPQRSTUVWXYZ;0123456789!@#%^&*\r\n";
        val  sb: StringBuffer = StringBuffer()
        for (i in 1..16)
        {
            sb.append(data);
        }

        cpclPrinter.setForm(0, 200, 200, 406, 384, 1);
        cpclPrinter.setMedia(2);

        // MultiLine mode.
        cpclPrinter.setMultiLine(15);
        cpclPrinter.multiLineText(0, 0, 0, 10, 20);
        cpclPrinter.multiLineData(sb.toString());
        cpclPrinter.resetMultiLine();
        // Print
        cpclPrinter.printForm();
        val message = "Printer check: ${cpclPrinter.printerCheck().toString()}"
        println(message)
        callback(Result.success(true))
    }

    override fun printImage(image: List<Long>, callback: (Result<Boolean>) -> Unit) {

        callback(Result.success(true))
    }

    override fun printPDF(pdfData: List<Long>, width: Long, height: Long, callback: (Result<Boolean>) -> Unit) {
        callback(Result.success(true))
    }
}