import 'package:get/get.dart';

class LoginState extends GetxController{
  final isPasswordVisible = true.obs;
  void togglePasswordVisibility(){
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}