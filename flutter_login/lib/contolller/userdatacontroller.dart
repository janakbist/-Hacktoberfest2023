import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_login/model/usermodel.dart';
import 'package:get/get.dart';

class UserDataController extends GetxController {

  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref(); 
  final formKey = GlobalKey<FormBuilderState>();
  List<dynamic> dataList =[].obs;

  var isLoading = false.obs ;
    
  void sendData() {
    if (formKey.currentState!.saveAndValidate()) {
      final formData = formKey.currentState!.value;
      final name = formData['name'].toString();
      final email = formData['email'].toString();
      final age = int.parse(formData['age'].toString());

      final user = UserModel(name: name, email: email, age: age);
      databaseReference.child('student').push().set(user.toJson());

      FocusManager.instance.primaryFocus?.unfocus(); // Dismiss the keyboard
      Get.snackbar("Success", "Data sent to Firebase successfully",snackPosition: SnackPosition.BOTTOM);
      formKey.currentState!.reset();
    }
  }

void fetchData() {
  isLoading.value = true;

  databaseReference.child('student').onValue.listen((event) {
    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> data = event.snapshot.value as dynamic;
      dataList.clear();
      dataList.addAll(data.values.toList());
    }
    isLoading.value = false;
  });
}


void setPasswordResetLink() async{
  if (formKey.currentState!.saveAndValidate()) {
    final formData = formKey.currentState!.value;
    final email = formData['email'].toString();
  if(await chechUserExit(email)) {
    isLoading.value=true;
     try {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
    ); 
    isLoading.value =false;
    FocusManager.instance.primaryFocus?.unfocus(); // Dismiss the keyboard
    Get.snackbar("Success", "Password Reset Link sent to $email check your mail and click the link to procceed.",snackPosition: SnackPosition.TOP,duration: const Duration(seconds: 10));
    formKey.currentState!.reset();
  }  catch (e) {
    isLoading.value=false;
    Get.snackbar("Failure", "Unable to sent resetlink:  $e",snackPosition: SnackPosition.TOP,duration: const Duration(seconds: 10));
  }
  }else{
    isLoading.value=false;
    Get.snackbar("Failure", "User not found: $email. Please try valid email.",snackPosition: SnackPosition.TOP,duration: const Duration(seconds: 10));
  }
  }
}
Future<bool> chechUserExit(String email) async {
  try {
    final user = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    return user.isNotEmpty;

}catch(e) {
  return false;
}
}


}

