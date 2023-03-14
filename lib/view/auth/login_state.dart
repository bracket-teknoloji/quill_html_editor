
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginState extends GetxController{
  final isPasswordVisible = true.obs;
  void togglePasswordVisibility(){
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  Widget getIcon (){
    if(isPasswordVisible.value){
      return const Icon(Icons.visibility);
    }else{
      return const Icon(Icons.visibility_off);
    }
  }
}