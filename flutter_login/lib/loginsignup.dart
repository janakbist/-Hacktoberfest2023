import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_login/contolller/userdatacontroller.dart';
import 'package:flutter_login/forgotpassword.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import 'helperclass.dart';

class LoginSignupTabView extends StatefulWidget {
  const LoginSignupTabView({super.key});

  @override
  _LoginSignupTabViewState createState() => _LoginSignupTabViewState();
}

class _LoginSignupTabViewState extends State<LoginSignupTabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final UserDataController udc = Get.put(UserDataController());
  final UserDataController udcf = Get.find<UserDataController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this,initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(38.0),
          child: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            controller: _tabController,
            tabs: const [
              Tab(child: Text("Sign In",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),),
              Tab(child: Text("Sign Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              LoginTab(tabController: _tabController,),
              SignupTab(tabController: _tabController,),
            ],
          ),
        ),
      ],
    );
  }
}

class LoginTab extends StatefulWidget {
    final TabController tabController;


  const LoginTab({super.key,required this.tabController});

  
  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {

  final _formKey = GlobalKey<FormBuilderState>();
  late Map<String, dynamic> formData = {};
  var userData;
  var passData; 
  bool _obscureText = false;
  late DataHelper userDataController;
  String? helperEmail;
  String? helperPassword;

  @override
  void initState() {
    super.initState();
    userDataController = Get.find();
    helperEmail = userDataController.email.value;
    helperPassword = userDataController.password.value;
  }




  @override
  Widget build(BuildContext context) {
         return Padding(
              padding: const EdgeInsets.all(18.0),
              child: FocusScope(
                child: FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FormBuilderTextField(
                          initialValue: "test@gmail.com",
                          name: 'email',
                          // controller: _controller,
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
                              onChanged: (value){
                      
                              },
                          ),
                      ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FormBuilderTextField(
                            initialValue: "Test@123",
                            name: 'password',
                            // controller: _controller,
                            obscureText: !_obscureText,
                            decoration:  InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Password",
                              // prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                        ),
                                        onPressed: () => setState(() {
                                          _obscureText = !_obscureText;
                          
                                        }),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              )
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(8),
                              FormBuilderValidators.match(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',errorText: "required number, capital letter and special character"),
                        
                            ]),
                            onChanged: (value) {
                        
                            },
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
                                  if(_formKey.currentState!.saveAndValidate()){
                                    setState(() {

                                    formData = _formKey.currentState!.value;
                                    userData = formData['email'].toString();
                                    passData = formData['password'].toString();
                                    FocusManager.instance.primaryFocus?.unfocus(); // Dismiss the keyboard 

                                        //Firebase signin instance
                                        firebaseSignIn(); 
                                        //clear form field after successfull login
                                        helperEmail='';
                                        helperPassword='';  

                                        });
                                  }
                                  
                            
                                }, 
                                child: const Text("Login",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=>const ForgetPassword(title: "Forgot Password"));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                child: const Text("Forgot Password? ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))
                                ),
                            ),
                          ),
                    ],
                  )),
              ),
         );
}

          void firebaseSignIn() async{
            SimpleFontelicoProgressDialog loading = SimpleFontelicoProgressDialog(context: context);
            final UserDataController udc = Get.put(UserDataController());

                      try {
                          loading.show(
                            message: "Connecting...",
                            height: 80,
                            width: 150,
                            type: SimpleFontelicoProgressDialogType.spinner,
                            horizontal: true,
                          );

                          // Attempt to sign in with the user's email and password
                          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: userData,
                            password: passData,
                          );
                          Future.delayed(const Duration(seconds: 2));
                          Get.snackbar("Success", "Login Successfull.",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green,duration: const Duration(seconds: 2));

                          _formKey.currentState!.reset();
                          loading.hide();

                          // Navigate to the home screen if the sign-in was successful
                          // udc.setValidUser(userData);
                          // Get.to(()=>const HomePage());
                          Get.toNamed("/homepage",arguments: '$userData');
                        } on FirebaseAuthException catch (e) {
                          loading.hide();

                          if (e.code == 'user-not-found') {
                            // Display an error message to the user indicating that their account does not exist
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text('We could not find this user. Do you want to create a new user?'),
                                  actions: [
                                    TextButton(
                                      child: const Text('Register',style: TextStyle(color: Colors.blue,)),
                                      onPressed: () {
                                        // dialogRegister = true;
                                        Navigator.of(context).pop();
                                        _formKey.currentState!.reset();
                                        widget.tabController.index = 1;
                                      },
                                    ),
                                    TextButton(
                                      child: const Text("Cancel",style: TextStyle(color: Colors.blue,)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          } else if (e.code == 'wrong-password') {
                            // Display an error message to the user indicating that their password is incorrect
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text('The password you entered is incorrect. Please try again.'),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK',style: TextStyle(color: Colors.blue,)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    // TextButton(onPressed: (){
                                    //   Navigator.of(context).pop();
                                    //   _loading.hide();
                                    // }, child: Text("Cancel"))
                                  ],
                                );
                              },
                            );
                          }
                        }catch(e) {
                          print(e.toString());
                        }

  }
}
class SignupTab extends StatefulWidget {
      final TabController tabController;

  const SignupTab({super.key,required this.tabController});

  @override
  _SignupTabState createState() => _SignupTabState();
}

class _SignupTabState extends State<SignupTab> {

  final _formKey = GlobalKey<FormBuilderState>();
  late Map<String, dynamic> formData = {};
  var userData;
  var passData; 
  var cPassData;
  bool _obscureText = false;
  final DataHelper userDataController = Get.put(DataHelper());


  @override
  Widget build(BuildContext context) {
         return Padding(
              padding: const EdgeInsets.all(18.0),
              child: FocusScope(
                child: FormBuilder(
                  key: _formKey,
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
                              onChanged: (value){
                      
                              },
                          ),
                      ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FormBuilderTextField(
                            name: 'password',
                            // controller: _controller,
                            obscureText: !_obscureText,
                            decoration:  InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Password",
                              // prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                        ),
                                        onPressed: () => setState(() {
                                          _obscureText = !_obscureText;
                          
                                        }),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              )
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(8),
                              FormBuilderValidators.match(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',errorText: "required number, capital letter and special character"),
                        
                            ]),
                            onChanged: (value) {
                        
                            },
                            ),
                        ),
                                         Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FormBuilderTextField(
                            name: 'confirmpassword',
                            // controller: _controller,
                            obscureText: !_obscureText,
                            decoration:  InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Confirm Password",
                              // prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                        ),
                                        onPressed: () => setState(() {
                                          _obscureText = !_obscureText;
                          
                                        }),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              )
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(8),
                              FormBuilderValidators.match(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',errorText: "required number, capital letter and special character"),
                        
                            ]),
                            onChanged: (value) {
                        
                            },
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
                                  if(_formKey.currentState!.saveAndValidate()){
                                    // setState(() {

                                    formData = _formKey.currentState!.value;
                                    userData = formData['email'].toString();
                                    passData = formData['password'].toString();
                                    cPassData = formData['confirmpassword'.toString()];
                                    FocusManager.instance.primaryFocus?.unfocus(); // Dismiss the keyboard
                                    if(passData == cPassData) {
                                      firebaseSignUp();

                                  }else{
                                    _formKey.currentState?.fields['confirmpassword']?.invalidate('Password doesnot match.');
                                  }
                                  // });
                                  }
                                  
                            
                                }, 
                                child: const Text("Register",style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=> const ForgetPassword(title: "Forgot Password"));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                child: const Text("Forgot Password? ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))
                                ),
                            ),
                          ),
                    ],
                  )),
              ),
         );

            }
            
              void firebaseSignUp() async{
                SimpleFontelicoProgressDialog loading = SimpleFontelicoProgressDialog(context: context);

                                                        //Firebase signin instance
                                                try {
                                                  loading.show(message: "Registering...",height: 80,width: 150,type: SimpleFontelicoProgressDialogType.spinner,horizontal: true);                          
                                                  // Attempt to sign in with the user's email and password
                                                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                                    email: userData,
                                                    password: passData,
                                                  );
                                                  Future.delayed(const Duration(seconds: 3));
                                                  Get.snackbar("Sucess", "Successfully registered.",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green,duration: const Duration(seconds: 2));
                                                  const SnackBar(content: Text("Registration successfull"));
                                                  _formKey.currentState!.reset();
                                                  loading.hide();
                                                  userDataController.setUserData(userData,passData);
                                                  setState(() {
                                                    // Inside the signup tab

                                                    widget.tabController.index=0;
                                                  });
                            
                                                } on FirebaseAuthException catch (e) {
                                                  if (e.code == 'weak-password') {
                                                    // Display an error message to the user indicating that their account does not exist
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: const Text('Error'),
                                                          content: const Text('Weak Password.Please enter strong password'),
                                                          actions: [
                                                            TextButton(
                                                              child: const Text('OK',style: TextStyle(color: Colors.blue,)),
                                                              onPressed: () {
                                                                loading.hide();
                                                                Navigator.of(context).pop();
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  } else if (e.code == 'email-already-in-use') {
                                                    // Display an error message to the user indicating that their password is incorrect
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: const Text('Error'),
                                                          content: const Text('Email is already in use. Please try another email.'),
                                                          actions: [
                                                            TextButton(
                                                              child: const Text('OK',style: TextStyle(color: Colors.blue,)),
                                                              onPressed: () {
                                                                loading.hide();
                                                                Navigator.of(context).pop();
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                }catch (e) {
                                                  print(e.toString());
                                                }
              }
}