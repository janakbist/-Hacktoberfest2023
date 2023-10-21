import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_login/contolller/userdatacontroller.dart';
import 'package:flutter_login/forgotpassword.dart';
import 'package:flutter_login/provider/firebaseserviceprovider.dart';
import 'package:flutter_login/state/appstate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class LoginTab extends ConsumerStatefulWidget {
    final TabController tabController;


  const LoginTab({super.key,required this.tabController});

  
  @override
  ConsumerState<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends ConsumerState<LoginTab> {

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
    // helperEmail = HelperClass.email.toString();
    // helperPassword = HelperClass.password.toString();
  }




  @override
  Widget build(BuildContext context,) {
        SimpleFontelicoProgressDialog _dialog = SimpleFontelicoProgressDialog(context: context);
        String email = ref.watch(emailProvider).toString();

         return Consumer(builder: (context,ref,child){
                ref.listen<AppState>(credentialsProvider, (previous, next) { 
                  next.maybeMap(
                    loading: (value) {
                    if(value.loading!) {
                      _dialog.show(message: 'loading',type: SimpleFontelicoProgressDialogType.normal);                     
                    }else {
                      _dialog.hide();                      
                    }
                               
                     },error: (value){
                      debugPrint('error message: ${value.data}');
                        showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('${value.data!}'),
                                  content: const Text('The password you entered is incorrect. Please try again.'),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK',style: TextStyle(color: Colors.blue,)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                     },userError: (value) {
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
                       
                     },firebaseError: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("something went wrong.${value.data!}."),duration: Duration(seconds: 10),));       
                     },
                     success: (value) {
                      _formKey.currentState!.reset();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("loggedIn successfully"),duration: Duration(seconds: 1),));            
                     },orElse: () {
                                return const Text("Error occured");                                
                              },);
                            });
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
                          initialValue: email,
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
                            // initialValue: helperPassword,
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

                                    formData = _formKey.currentState!.value;
                                    userData = formData['email'].toString();
                                    passData = formData['password'].toString();
                                    debugPrint('$userData');
                                    ref.read(credentialsProvider.notifier).firebaseLogin(userData, passData);
                                    FocusManager.instance.primaryFocus?.unfocus(); // Dismiss the keyboard 
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
                          });
         
}
}
class SignupTab extends ConsumerStatefulWidget {
      final TabController tabController;

  const SignupTab({super.key,required this.tabController});

  @override
  _SignupTabState createState() => _SignupTabState();
}

class _SignupTabState extends ConsumerState<SignupTab> {

  final _formKey = GlobalKey<FormBuilderState>();
  late Map<String, dynamic> formData = {};
  var userData;
  var passData; 
  var cPassData;
  bool _obscureText = false;
  final DataHelper userDataController = Get.put(DataHelper());


  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog _dialog = SimpleFontelicoProgressDialog(context: context);

         return Consumer(builder: (context,ref,child){
          ref.listen<AppState>(registrationProvider, (previous, next) { 
            next.maybeMap(
              loading: (value) {
                if(value.loading!) {
                  _dialog.show(message: "Registering",type: SimpleFontelicoProgressDialogType.normal);
                }else {
                  _dialog.hide();                  
                }
              }, error: (value) {
                        showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('${value.data.join(', ')}'),
                                  content: const Text('Email already in use  try another email'),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK',style: TextStyle(color: Colors.blue,)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                                  
              },userError: (value) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('weak password'),
                                  content: const Text('password format does not match'),
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
              },firebaseError: (value){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${value.data.join(', ')}.please try again."),duration: Duration(seconds: 10),));
              },
              success: (value) {
                _formKey.currentState!.reset();
                widget.tabController.animateTo(0);
                Get.snackbar("Sucess", "Successfully registered.",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green,duration: const Duration(seconds: 2));                 
              },
              orElse: (){
              return const Text("Error occured");                                
            });
          });
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
                                      ref.read(registrationProvider.notifier).firebaseRegister(userData, passData);
                                      ref.read(emailProvider.notifier).getEmail(userData);
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
                              Get.to(()=> ForgetPassword(title: "Forgot Password"));
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
         );

            }
            
}