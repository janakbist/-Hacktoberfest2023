import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormError extends StatefulWidget{
  const FormError({super.key});

  State<StatefulWidget> createState() => _FormErrorSate();

}
class _FormErrorSate extends State<FormError>{
  //form data can be accessed by using form key.
  //form data are stored in key value pair
  late Map<String, dynamic> formData = {};
  final _formKey = GlobalKey<FormBuilderState>();
  final _buttonKey = GlobalKey<FormBuilderFieldState>();
  final _emailKey = GlobalKey<FormBuilderFieldState>();
  final String server = defaultTargetPlatform == TargetPlatform.android ? "10.0.0.2" : "localhost"; 
  late  bool showPassword =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Error Handling"),
),
      body: Center( 
        child: Column(
          children: [
            Image.network('http://$server:8000/bb.png',height: 100,width: 300,),
            FormBuilder(
              key:_formKey,
              child: Column(
              children: [
                FormBuilderTextField(
                  key: _emailKey,
                  name: 'email',
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "a@gmail.com",
                    labelText: "Email",
                    hintStyle: TextStyle(color: Colors.red),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                  onChanged: (value){

                  },
                  ),
                  FormBuilderTextField(
                    obscureText: !showPassword,
                    name: 'password',
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.security),
                      suffixIcon:  IconButton(
                         icon: const Icon(Icons.remove_red_eye),
                         onPressed: (){
                          setState(() {
                            showPassword = !showPassword;
                          });
                         },
                         ),
                    ),
                    ),
                  FormBuilderFilterChip(
                    name: 'filterChip', options: const [
                      FormBuilderChipOption(value: "sunday"),
                      FormBuilderChipOption(value: "monday"),
                      FormBuilderChipOption(value: "tuesday"),
                      FormBuilderChipOption(value: "wednesday"),
                      FormBuilderChipOption(value: "thusday"),
                      FormBuilderChipOption(value: "friday"),
                      FormBuilderChipOption(value: "saturday"),

                    ],),
  
                  ElevatedButton( 
                    key: _buttonKey,
                    onPressed:() async{
                      setState(() {
                        if (_formKey.currentState!.saveAndValidate()) {
                          if(_emailKey.currentState?.value=="a@gmail.com") {
                            _emailKey.currentState?.invalidate('Email already taken');
                            }else {
                              formData = _formKey.currentState!.value;
                            }
                            }
                            }
                            );

                    } ,
                     child:const Text("Submit"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.reset(); // clear form data
                          const snackBar = SnackBar(
                            content: Text('Text field Cleared!'),
                            padding:EdgeInsets.all(10),
                            backgroundColor: Colors.red,
                            dismissDirection: DismissDirection.endToStart,
                            
                            );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          child: const Text('Clear'),
      ),  
                      Text("Email : ${formData['email']}"),
                      Text("Days you Like : ${formData['filterChip']}"),
            ],
            )),
        ],),
      ),
    );
  }

}