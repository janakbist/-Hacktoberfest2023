import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_login/contolller/userdatacontroller.dart';
import 'package:flutter_login/getxhome.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';




class HomePage extends StatefulWidget {

  const HomePage({super.key});
  
  @override
  State<StatefulWidget> createState() =>HomepageState();
  
}

class HomepageState extends State<HomePage> {
  
  final UserDataController udc = Get.put(UserDataController());
  final UserDataController userDataController = Get.find<UserDataController>();


  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog loading = SimpleFontelicoProgressDialog(context: context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 91, 171, 236),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Row(children: [
        //  Obx(() =>  Text(userDataController.successUser.value,style: const TextStyle(fontSize: 14),),),
        Text("${Get.arguments}"),
          TextButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            Get.back(result: 'signedout');
            },
            child: const Padding(
              padding:  EdgeInsets.only(left:140.0),
              child: Icon(Icons.logout,color: Colors.white),
            ),) , 
          
        ],)
        
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
               FocusScope(
                child: FormBuilder(
                  key: udc.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FormBuilderTextField(
                          name: 'email',
                          // controller: _controller,
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.email),
                            hintText: 'Email Address',
                            // errorStyle: TextStyle(color: Color.fromARGB(255, 44, 42, 42)),
                            // hintText: "jackson@gmail.com",
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
                          padding: const EdgeInsets.all(16.0),
                          child: FormBuilderTextField(
                            name: 'name',
                            // controller: _controller,
                            decoration:  const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter fullname",
                              border:  OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              )
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(3),                        
                            ]),
                            ),
                        ),
                                         Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FormBuilderTextField(
                            name: 'age',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter your age",
      
                              border:  OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              )
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.numeric(),
      
                        
                            ]),
                            ),
                        ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Container(
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.0),
                                         // Set the desired radius value
                                         ),
                                         ),
                                         ),
                                onPressed: () {
                                  udc.sendData();                                                                 
                                }, 
                                child: const Text("Submit",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                            ),
                          ),
                    ],
                  )
                  ),
              ),
              TextButton(onPressed: (){
                Get.to(()=> const GetxHome());                
              }, child: const Text("Got to getXHome",style: TextStyle(color: Colors.white),)),
              TextButton(onPressed:() =>userDataController.fetchData(), child: const Text("Fetch Data")),
              
              Expanded(
                child: Column(
                  children: [
                    Expanded(              
                      child: Obx(() {
                       return userDataController.isLoading.value ? const Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 182, 39, 39),)) : buildWidgit();
                      }),
                    ),
                  ],
                ),
              ),

          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  buildWidgit() {
        var  itemCount = userDataController.dataList;
        return ListView.builder(
          itemCount: itemCount.length,
          itemBuilder: (context, index) {
            final data = itemCount[index];
            return ListTile(
              title: Text("Name: ${data['name'].toString()}"),
              subtitle: Text("Email: ${data['email'].toString()}"),
              trailing: Text("Age: ${data['age'].toString()}"),
            );
          },
        );
  }
}
