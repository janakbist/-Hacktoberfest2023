import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GetxHome extends StatefulWidget {
  const GetxHome({super.key});
  @override
  State<StatefulWidget> createState() =>_GetxHome();
  
}
class _GetxHome extends State<GetxHome> {
  final GetxtController gc = Get.put(GetxtController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("GetxHome")
      ),
      body: Center(
       child: Column(children: [
        Obx(() =>  Text("Count ${gc.count.value}")),
        TextButton(onPressed: (){
          gc.increment();          
        }, child: const Icon(Icons.add)),
        TextButton(onPressed: (){
          gc.decrement();          
        }, child: const Text("-")),
        TextButton(onPressed: (){
          Get.snackbar("Sucess", "Successfully implemented Getx snackbar",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green);
        }, child: const Text("Getx snackbar")),
        TextButton(onPressed: () {
          Get.defaultDialog(
            title: 'GetX Alert',
            middleText: 'Simple GetX alert',
            textConfirm: 'Okay',
            onConfirm: () {
              Navigator.pop(context);
            },
            confirmTextColor: Colors.green,
            textCancel: 'Cancel');
        }, child: const Text("getx Dialog"))
       ],)
      ),
    );
  }

}
class GetxtController extends GetxController{
  var count = 0.obs;
  increment() =>count ++;
  decrement() => count --;
}