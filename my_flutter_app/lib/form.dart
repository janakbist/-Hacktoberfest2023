import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:my_flutter_app/appdatabase.dart';

// import 'entitydetails.dart';


class FormExample extends StatefulWidget {
  const FormExample({super.key});
    
  @override
  State<StatefulWidget> createState() => _FormPageState();

}
  class _FormPageState extends State<FormExample> {
    late String nameError;
    late String emailError;
    final formKey = GlobalKey<FormBuilderState>();
    final _ageKey = GlobalKey<FormBuilderFieldState>();
    final _nameKey = GlobalKey<FormBuilderFieldState>();

    late Map<String, dynamic> formData = {};
    List<String?> games =['footbal','cricket','basketball'];
    List<String?> selectedCkb =[];
    String? selectedRb ='Not Selected Yet' ;
    String? selectedCoice;
    DateTime? dt ;

    //----------------------Database part----------------------------------------------------

    // final appDatabase =  $FloorAppDatabase.databaseBuilder('app_database.db').build();




    //-------------------------//------------------------------------------------------------
  
    bool ignoring = true;
    void setIgnoring(bool newValue) {
      setState(() {
      ignoring = newValue;
    });
  }
  bool isVisible = true;
  void setVisible(bool newvalue) {
    setState(() {
      isVisible = !isVisible;
      });
}

    GlobalKey buttonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Flutter Form Builder"),
      
      ),
      
      body: Center(            
        child:ListView(
          
          padding: const EdgeInsets.all(4.0),
          children: [
            FormBuilder(
              key:formKey,
              child: Column(
                children:[
                  SizedBox(
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                                
                      child: FormBuilderTextField(
                        key: _nameKey,
                        name: 'name',
                        decoration:  const InputDecoration(
                          prefixIcon: Icon(Icons.group),
                          // prefixIconColor: Theme.of(context).iconTheme.color,
                          // prefixIconColor: Colors.red,
                        labelText:"Enter your Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          gapPadding: 4.0,
                        ),
                        filled: false,
                        hintText: "jackson",
                        // hintStyle: TextStyle(color: Colors.red)
                        // errorText: nameError,
                        // errorText: "Invalid name",      
                                    ),
                                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.match(r'^[a-zA-Z]+$',errorText: 'Name must contain only alphabetic characters'),
                      FormBuilderValidators.maxLength(20,errorText: 'Name must be less than 20 characters'),
                      FormBuilderValidators.minLength(3,errorText: 'Name must be at least 2 characters'),
                                
                                    ],),
                                    onChanged: (val) {
                      if(val!.isEmpty) {
                        setIgnoring(true);
                        }else {
                          setIgnoring(false);
                          }              
                                },
                                    ),
                    ),
                  ),
                SizedBox(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: FormBuilderTextField(
                      name: 'email',
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        // prefixIconColor: Colors.red,
                        labelText: 'Email',
                        hintText: "jackson@gmail.com",
                        // hintStyle: TextStyle(color: Colors.red),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          gapPadding: 4.0,
                        ),
                        // errorText: emailError,
                        ),
                      validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                      
                    ]),
                    onChanged: (val) {
                      // print(val);
                    },
                    ),
                  ),
                ),
                FormBuilderTextField(
                  name: 'age',
                  key: _ageKey,
                  decoration: const InputDecoration(
                    labelText: "Enter your age",
                    hintText: "age",
                  ),
                  ),
                FormBuilderCheckboxGroup(
                  name: 'games',
                  decoration: const InputDecoration(
                    icon: Icon(Icons.games),
                    labelText: 'Select your favourite games',
                    border: InputBorder.none,
                  ),
                  options: [
                    FormBuilderFieldOption(value: games[0]),
                    FormBuilderFieldOption(value: games[1]),
                    FormBuilderFieldOption(value: games[2]),
                  ],
                  
                  onChanged: (value){
                    setState(() {
                      selectedCkb = value!;
                    });
                  },
                   ),
                   FormBuilderChoiceChip(
                    name: 'choiceChip',
                    decoration: const InputDecoration(
                      labelText: 'Select an option',
                      border: InputBorder.none
                      ),
                    initialValue: 'sunday',
                     options: const [
                      FormBuilderChipOption(value: 'Sunday'),
                      FormBuilderChipOption(value: 'Monday'),
                      FormBuilderChipOption(value: 'Tuesday'),
                      FormBuilderChipOption(value: 'Wednesday'),
                      FormBuilderChipOption(value: 'Thusday'),
                      FormBuilderChipOption(value: 'Friday'),
                      FormBuilderChipOption(value: 'Saturday'),
                     ],
                     padding: const EdgeInsets.all(6.0),
                     spacing: 20,
                     onChanged: (value) {
                      setState(() {
                        selectedCoice= value;
                      });
                     },
                     ),
                     FormBuilderRadioGroup(
                      name: 'gender',
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Gender',
                        border: InputBorder.none,
                      ),
                      options: const [
                      FormBuilderFieldOption(value: 'Male'),
                      FormBuilderFieldOption(value: 'Female'),
                      FormBuilderFieldOption(value: 'Others'),
                     ],
                     onChanged: (value){
                      setState(() {
                        selectedRb =value!; 
                      });                
                     },
                     ),
                     FormBuilderDateTimePicker(
                      name: 'datePicker',
                      inputType: InputType.both,
                      decoration: const InputDecoration(labelText: "Select date of birth"),
                      validator: FormBuilderValidators.required(),
                      initialDate: DateTime.now(),
                      onChanged: (value){
                        dt = value;
                      },

                     ),
                              
                IgnorePointer(
                  ignoring: ignoring,
                  child:ElevatedButton(
                    key: buttonKey,
                     onPressed: () async =>{
                      _ageKey.currentState?.didChange('40'),
                  if (formKey.currentState!.saveAndValidate()) {
                    setState(() {
                      //get form fileds values
                      formData = formKey.currentState!.value;
                      //invalidate form state key
                      if(_nameKey.currentState!.value=="jack") {
                      formKey.currentState?.fields['name']?.invalidate('you cannot use name jack');
                      // OR invalidate using Field Key
                      _nameKey.currentState?.invalidate('you cannot use name jackson !!!!!!!!!');
                      }
                      // final personDao = appDatabase.personDao;
                      // final person = Person(1, 'Frank','2','2','2','2','2');
                      // personDao.insertPerson(person);
                      // final result =  personDao.findPersonById(1);
                        })
                      }  ,
                      if(ignoring==true)  {
                        ElevatedButton.styleFrom(
                          textStyle: const TextStyle(color: Color.fromARGB(255, 163, 119, 119)),
                      ),                    
                      }        
                },
                 child: const Text("Submit"),
                 )),
                 ElevatedButton(
                  onPressed: () async{
                    setVisible(false);
                  },
                   child: const Text("Hide show")),
                  const SizedBox(height: 16.0),
                  Visibility(
                    visible:isVisible,
                    child: Text('Name: ${formData['name']}'),
                    ),
                  Text('Email: ${formData['email']}'),
                  Text("Choice : ${formData['games']}"),
                  Text("Selected Value is : ${formData['choiceChip']}"),
                  Text("Seleceted gender is : ${formData['gender']}"),
                  Text("DOB:$dt"),
                  Text("Age: ${formData['age']}"),
            ])
            ,),
          ],
        )
        
      ),
      drawer: Drawer(
                      child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

    );

  }
    
  }

