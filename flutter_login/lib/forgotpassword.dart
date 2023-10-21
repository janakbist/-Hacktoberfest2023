
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'contolller/userdatacontroller.dart';


class ForgetPassword extends StatefulWidget {
   const ForgetPassword({super.key, required this.title});


  final String title;

  @override
  State<ForgetPassword> createState() => _ForgetPasswordPage();
}

class _ForgetPasswordPage extends State<ForgetPassword> {
  final UserDataController udc = Get.put(UserDataController());
  final UserDataController udcf = Get.find<UserDataController>();

  // final _formKey = GlobalKey<FormBuilderState>();
  // late Map<String, dynamic> formData = {};
  // var userData='';
  // bool isUser = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 148, 235),
      body: ListView(
        // child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: (){},
                         icon: const Icon(Icons.add_task_outlined,weight: 20,size: 90,color: Colors.white,),
                         ),
                    ),
                      const Padding(
                         padding:  EdgeInsets.only(top: 50,left: 65),
                         child:  Text("Tasks",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.white),),
                       ),
                  ]),
                ),
               const  Padding(
                  padding: EdgeInsets.only(left:88.0,top: 2,right: 60),
                  child: Text("Enter your credentials to access your account.",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white ),),
                ),
      
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    const Padding(
                      padding: EdgeInsets.all(38.0),
                      child: Text("Forgot Password",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                    ),
                    FocusScope(
                      child: FormBuilder(
                        key: udc.formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(26.0),
                              child: FormBuilderTextField(
                                name: 'email',                      // controller: _controller,
                                  decoration: const InputDecoration(
                                    // prefixIcon: Icon(Icons.email),
                                    // labelText: 'Email Address',
                                    // errorStyle: TextStyle(color: Color.fromARGB(255, 44, 42, 42)),
                                    hintText: "Email Address",
                                    // hintStyle: TextStyle(color: Colors.red),
                                    filled: true,
                                    fillColor: Colors.white,
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white) ,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      // errorText: emailError,
                                      ),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.email(),
                                      ]),
                                ),
                            ),
                              Padding(
                                padding:  const EdgeInsets.all(16.0),
                                child: Container(
                                  height: 60,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),),
                                    onPressed: () {
                                      udc.setPasswordResetLink();
                                    },
                                     child: const Text(" Send verification link",style: TextStyle(backgroundColor: Colors.white, color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold)),
                                     ),
                                ),
                              ),
                              // Obx(() {
                              //   return udcf.isLoading.value ? Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 172, 40, 31),),) : Text('');
                              // }),
                          ],
                          )
                          ),
                    )
                  ],
                  ),
                )
                
              ],
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton(onPressed: () => Navigator.pop(context),backgroundColor: Colors.white,foregroundColor: Colors.blue,child: const Icon(Icons.home),),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
