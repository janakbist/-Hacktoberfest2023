import 'package:get/get.dart';

class DataHelper extends GetxController{
  final email="".obs;
  final password="".obs;
  void setUserData(String email ,String password){
    this.email.value = email;
    this.password.value = password;
  }
  var isPasswordVisible = false.obs;
  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
}

