import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:mobielbank/homescreens/dashboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobielbank/provider/branchprovider.dart';
import 'package:mobielbank/provider/pinoptionprovider.dart';
import 'package:mobielbank/provider/useraccountprovider.dart';

class CardRequest extends ConsumerStatefulWidget {
  const CardRequest({final Key? key}) : super(key: key);

  @override
  _CardRequestState createState() => _CardRequestState();
}

class _CardRequestState extends ConsumerState<CardRequest> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(final BuildContext context) {
    final accountProvider = ref.watch(accountListProvider);
    final branchProvider = ref.watch(branchListProvider);
    final pinOptionDataProvider = ref.watch(pinOptionProvider);
    final selectedPinDataProvider =  ref.watch(pinDataProvider);
    final selectedAccountData = ref.watch(accountDataProvider);
    final selectedBranchData = ref.watch(branchDataProvider);


    return Scaffold(
        backgroundColor: const Color.fromARGB(237, 236, 234, 234),
        body:  Stack(
          alignment: Alignment.topCenter,
          children: [
            const ToolbarContainer(),
            Positioned(
              top: 95,
              height: 700,
              width: 370,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Card(
                    surfaceTintColor: Colors.white,
                    color: Colors.white,
                    child: Wrap(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top:26.0,left:16,right: 16,bottom: 16),
                          child: Text("Card Information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: FormBuilder(
                            key: _formKey,
                            clearValueOnUnregister: true,
                            child: Wrap(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left:16.0),
                                  child: Text("Account",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 119, 118, 118))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0,bottom: 8,left: 16,right: 16),
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isDismissible: true,
                                        isScrollControlled: true,
                                        enableDrag: true,
                                        constraints: const BoxConstraints(
                                          maxHeight: 600,
                                          maxWidth: 400,
                                        ),
                                        useSafeArea: true,
                                        // shape: RoundedRectangleBorder(
                                        //   borderRadius: BorderRadius.circular(10.0),
                                        // ),
                                        builder: ((context) {
                                        return accountProvider.map(  
                                          loading: (loading) {
                                            return const Center(child: CircularProgressIndicator());
                                          },
                                          data: (data){
                                            if (data.value.isNotEmpty) {
                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(16.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          const Text("Select account",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                                          IconButton(onPressed: (){
                                                            Navigator.pop(context);
                                                          }, icon: const Icon(Icons.cancel,color: Colors.blue,))
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 500,
                                                      child: ListView.builder(
                                                        itemCount: data.value.length,
                                                        itemBuilder: (context,index){
                                                          String primary;
                                                          if(data.value[index].primary=="Y") {
                                                            primary="PRIMARY";
                                                          }else {
                                                            primary="SECONDARY";
                                                          }
                                                          return InkWell(
                                                            onTap: () {
                                                              ref.read(accountDataProvider.notifier).getAccountData({"type":data.value[index].type,"number":data.value[index].number,"primary":primary});
                                                              Navigator.pop(context);                                                                                                                            
                                                            },
                                                            child: Card(
                                                              child: Column(
                                                                children: [
                                                                  Text("Account Type : ${data.value[index].type}"),
                                                                  Text("Account Number : ${data.value[index].number}"),
                                                                  Text("Primary : $primary"),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }else {
                                              return const Center(child: Text("Data not found.."),);
                                            }
                                          },
                                          error: (error){
                                            return const Center(child: Text("Something went wrong.."),);
                                          },); 
                                      })
                                      );
                                    },
                                    child: Container(
                                      height: 85,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color.fromARGB(255, 175, 174, 174)),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 16,left:16.0,right: 14.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(selectedAccountData["type"],style: const TextStyle(fontSize: 16,color: Colors.black)),
                                                const Icon(Icons.expand_more,size: 25,),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:4,bottom: 16,left:16.0,right: 16.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(selectedAccountData["number"],style: const TextStyle(color: Color.fromARGB(255, 143, 139, 139))),
                                                Container(
                                                  height: 20,
                                                  decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                                    color: Color.fromARGB(223, 206, 232, 243)
                                                    ),
                                                  child: Text(selectedAccountData["primary"],style: const TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Color.fromARGB(213, 6, 16, 158)),)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                               const Padding(
                                 padding: EdgeInsets.only(top:12.0,left: 16),
                                 child: Text("Collector Branch",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 119, 118, 118))),
                               ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0,bottom: 8,left: 16,right: 16),
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isDismissible: true,
                                        isScrollControlled: true,
                                        enableDrag: true,
                                        constraints: const BoxConstraints(
                                          maxHeight: 600,
                                          maxWidth: 400,
                                        ),
                                        useSafeArea: true,
                                        // shape: RoundedRectangleBorder(
                                        //   borderRadius: BorderRadius.circular(10.0),
                                        // ),
                                        builder: ((context) {
                                        return branchProvider.map(  
                                          loading: (loading) {
                                            return const Center(child: CircularProgressIndicator());
                                          },
                                          data: (data){
                                            if (data.value.isNotEmpty) {
                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(16.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          const Text("Select Branch",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                                          IconButton(onPressed: (){
                                                            Navigator.pop(context);
                                                          }, icon: const Icon(Icons.cancel,color: Colors.blue,))
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 500,
                                                      child: ListView.builder(
                                                        itemCount: data.value.length,
                                                        itemBuilder: (context,index){
                                                          return InkWell(
                                                            onTap: () {                                                                                                                                                                                                                                            
                                                              ref.read(branchDataProvider.notifier).getBranchData({"name":data.value[index].name,"code":data.value[index].code});
                                                              Navigator.pop(context);                                                                                                                                                                                         
                                                            },
                                                            child: SizedBox(
                                                              height: 40,
                                                              width: 90,
                                                              child: Card(
                                                                child: Center(child: Text("Branch : ${data.value[index].name}")),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }else {
                                              return const Center(child: Text("Data not found.."),);
                                            }
                                          },
                                          error: (error){
                                            return const Center(child: Text("Something went wrong.."),);
                                          },); 
                                      })
                                      );
                                    },
                                    child: Container(
                                      height: 55,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color.fromARGB(255, 175, 174, 174)),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child:Padding(
                                            padding: const EdgeInsets.only(left:16.0,right: 16.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(selectedBranchData["name"],style: const TextStyle(fontSize: 16,color: Colors.black)),
                                                const Icon(Icons.expand_more,size: 25,),
                                              ],
                                            ),
                                          ),
                                    ),
                                  ),
                                ),
                                pinOptionDataProvider.map(
                                  data: (data) {
                                    String? pinInfo;
                                    if (selectedPinDataProvider['name'] != null && selectedPinDataProvider['name'].isNotEmpty) {
                                      for (var option in data.value) {
                                        if (option.name == selectedPinDataProvider['name']) {
                                          pinInfo = option.info;
                                          break;
                                        }
                                      }
                                    }
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top:4.0,right: 16,left: 16),
                                          child: FormBuilderRadioGroup(
                                            decoration: const InputDecoration(
                                              labelText: "Pin Option",
                                              labelStyle: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 119, 118, 118)),
                                              border: InputBorder.none,
                                              ),
                                            name: 'pin_option',
                                            validator: FormBuilderValidators.required(),          
                                            wrapAlignment: WrapAlignment.start,
                                            options: data.value.map((data) {
                                              return data.name;
                                            })
                                              .map((lang) => FormBuilderFieldOption(value: lang))
                                              .toList(growable: false),
                                              onChanged: (value) {
                                                ref.read(pinDataProvider.notifier).getPinData({"name":value,"code":"","info":""});
                                              },
                                            ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left:16.0,right: 16,bottom: 16),
                                          child: Container(
                                            height: 120,
                                            width: 310,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 221, 236, 248),
                                            border: Border.all(color: const Color.fromARGB(255, 165, 208, 243)),
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                            child:  Stack(
                                              children: [
                                                const Positioned(top:20,left:10,child: Icon(Icons.error,color: Colors.blue,)),
                                                Padding(
                                                  padding: const EdgeInsets.only(left:40.0,top:20,right: 8,bottom: 8),
                                                  child: Text(pinInfo ?? "Please select a pin",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 4,
                                                  style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                                                ),
                                              ],
                                            )
                                          ),
                                        ),
                                      ],
                                    );                                  
                                },
                                error: (error) {                                                             
                                  return const Text("Something went wrong");
                                },
                                loading: (loading) {
                                  return const CircularProgressIndicator();
                                },
                                ),
                                const Divider(color: Color.fromARGB(255, 209, 206, 206),),
                                const Padding(
                                  padding:  EdgeInsets.only(left: 16,bottom:16.0,top: 30),
                                  child: Text("Personal Information",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                ),
                                Wrap(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left:16.0,right: 16,bottom: 4),
                                      child: Text("Date of birth",style: TextStyle(fontSize: 14,),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:16,right:16.0,bottom: 8),
                                      child: FormBuilderDateTimePicker(
                                        name: 'dob',
                                        lastDate: DateTime.now(),
                                        inputType: InputType.date,
                                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                                        format: DateFormat('yyyy-MM-dd'),
                                        decoration: const InputDecoration(
                                          hintText: 'Type or select a date',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(255, 175, 174, 174),
                                            )
                                          ),
                                          
                                          constraints: BoxConstraints(maxHeight: 55),
                                          suffixIcon: Icon(Icons.calendar_month,color: Color.fromARGB(195, 124, 123, 123),),
                                          ),
                                        validator: FormBuilderValidators.required(),
                                        
                                        ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left:16.0,right: 16,top: 8),
                                      child: Text("Citizenship Number",style: TextStyle(fontSize: 14,),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:16.0,right: 16,top: 4,bottom: 8),
                                      child: FormBuilderTextField(
                                        name: 'number',
                                        decoration: const InputDecoration(
                                          hintText: "1233324",
                                          constraints: BoxConstraints(maxHeight: 55),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(255, 175, 174, 174),
                                              ),
                                          )
                                        ),
                                        keyboardType: TextInputType.number,
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),  
                                          FormBuilderValidators.numeric(),                                  
                                        ]
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left:16.0,right: 16,top: 8),
                                      child: Text("Address",style: TextStyle(fontSize: 14,),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:16.0,right: 16,top: 4,bottom: 8),
                                      child: FormBuilderTextField(
                                        name: 'address',
                                        decoration: const InputDecoration(
                                          constraints: BoxConstraints(maxHeight: 55),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(255, 175, 174, 174),
                                              ),
                                          )
                                        ),
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),  
                                        ]
                                        ),
                                      ),
                                    ),
                                    const Divider(color: Color.fromARGB(255, 228, 225, 225),),
                                    Padding(
                                      padding: const EdgeInsets.only(left:16.0,right: 16,top: 8,bottom: 16),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                                            padding:const  EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Button padding
                                            minimumSize: const Size(330, 50), // Set the minimum size of the button
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8), // Button border radius
                                            ),),
                                        onPressed: (){
                                    
                                      }, child: const Text("Request for a New Card ",style: TextStyle(fontWeight: FontWeight.bold),)),
                                    )
                                  ],
                                )

                              ],
                            ) ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
}


class ToolbarContainer extends StatelessWidget {
  const ToolbarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      child: Container(
        width: 394,
        height: 95,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:16.0,bottom: 16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const BankingDashboard()));
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: 30,
                ),
                const Text("New Debit Card Request",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,overflow: TextOverflow.fade)),
              ]),
        ),
      ),
    );
  }
}
