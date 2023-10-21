import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MobileBankingTab extends StatefulWidget {
  final TabController tabController;
  const MobileBankingTab({super.key,required this.tabController});

  @override
  State<StatefulWidget> createState() => _MobileBankingTab();
}

class _MobileBankingTab extends State<MobileBankingTab>{
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  bool thumbVisible = true;
  List<String> paymentsList = ["Payments","Funds Transfer","Sends Money(Same Bank)","Fonepay(Inter Bank)","IPS Transfer","NPS Transfer","Load Wallet","Schedule Payments"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12.0,right: 12),
      child: SingleChildScrollView(
        child: Wrap(children: [
            const Padding(
              padding: EdgeInsets.only(top:16.0,left: 8,right: 8,bottom: 8),
              child: Text("Mobile Banking Limits", style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:16.0,right: 10,left: 110),
              child: CircularSeekBar(
                width: 100,
                height: 100,
                progress: 150,
                minProgress: 0,
                maxProgress: 200,
                barWidth: 10,
                startAngle: 80,
                sweepAngle: 200,
                strokeCap: StrokeCap.round,
                trackColor: const Color.fromARGB(255, 212, 210, 210),
                progressColor: Colors.green,
                child: Center(
                  child: ValueListenableBuilder(
                      valueListenable: _valueNotifier,
                      builder: (_, double value, __) => const Text('150/200', style: TextStyle(color: Colors.green),)),
                ), 
                ),
            ),
            const Center(child: FittedBox(child: Text("Total transaction left today",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color.fromARGB(221, 102, 101, 101))))), 
            const Padding(
              padding: EdgeInsets.only(left:8.0,right: 8,top: 16,bottom: 4),
              child:  Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),
                    Text("Rs. 50,000 / 1,00,000",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                  ],
                ),
              ),
            ),
            FittedBox(
              child: LinearPercentIndicator(
                width: 620,
                lineHeight: 8.0,
                animationDuration: 2500,
                percent: 0.5,
                linearStrokeCap: LinearStrokeCap.round,
                progressColor: Colors.green,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left:8.0,right: 8,top: 4,bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transferrable Amount",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101)),overflow: TextOverflow.ellipsis,),
                    Text("Rs. 50,000",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101)),overflow: TextOverflow.ellipsis,),
                  ],
                ),
            ),
            const Padding(
              padding: EdgeInsets.only(top:8.0,left: 8,right: 8,bottom: 4),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("This Month",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),
                  Text("Rs. 50,000 / 10,00,000",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                ],
              ),
            ),
            FittedBox(
              child: LinearPercentIndicator(
                width: 650,
                lineHeight: 8.0,
                animationDuration: 2500,
                percent: 0.2,
                linearStrokeCap: LinearStrokeCap.round,
                progressColor: Colors.green,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left:8,right:8,bottom:8,top:4),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transferrable Amount",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101)),),
                    Text("Rs. 9,50,000",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                  ],
                ),
            ), 
           const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
            const Padding(
              padding:  EdgeInsets.only(left:10.0,top: 8),
              child:  Text("Max per Transaction",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101)),),
            ),
            const Divider(height: 1,color: Colors.white,),
             const Padding(
               padding:  EdgeInsets.only(left:10.0),
               child: Text("Rs. 50,000",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101)),),
             ),  
             const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
             const Padding(
               padding: EdgeInsets.only(top:26.0,left: 8,right: 8),
               child:  Text("Transaction Types", style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0)),
             ),
             
             SizedBox( 
              height: 335,
               child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: paymentsList.length,
                itemBuilder: (context,index){
                  return Wrap(
                    children: [
                      InkWell(
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
                          return bottomSheetDialog(); 
                        }));
                        },
                        child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Text(paymentsList[index].toString()),
                         const Icon(Icons.arrow_forward_ios,size: 16,),
                                  ],),
                                     ),
                                   ),
                    ],
                  );
                //   return Wrap(
                //     children: [
                //       // const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
                //       InkWell(
                // onTap: () {
                //     showModalBottomSheet(
                //       context: context,
                //       isDismissible: true,
                //       isScrollControlled: true,
                //       enableDrag: true,
                //       constraints: const BoxConstraints(
                //         maxHeight: 600,
                //         maxWidth: 400,
                //       ),
                //       useSafeArea: true,
                //       // shape: RoundedRectangleBorder(
                //       //   borderRadius: BorderRadius.circular(10.0),
                //       // ),
                //        builder: ((context) {
                //       return bottomSheetDialog(); 
                //     }));
                //     },
                //     child: const Padding(
                //      padding: EdgeInsets.all(8.0),
                //      child: Row(
                //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //      children: [
                //      Text("Payments",),
                //      Icon(Icons.arrow_forward_ios,size: 16,),
                //               ],),
                //                  ),
                //                ),
                //                const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
                //   InkWell(
                //     onTap: () {
                //       showModalBottomSheet(
                //       context: context,
                //       isDismissible: true,
                //       isScrollControlled: true,
                //       enableDrag: true,
                //       constraints: const BoxConstraints(
                //         maxHeight: 470,
                //         maxWidth: 400,
                //       ),
                //       useSafeArea: true,
                //       // shape: RoundedRectangleBorder(
                //       //   borderRadius: BorderRadius.circular(10.0),
                //       // ),
                //        builder: ((context) {
                //       return bottomSheetDialog1(); 
                //     }));
                       
                //                 },
                //                  child: const Padding(
                //      padding: EdgeInsets.all(8.0),
                //      child: Row(
                //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //      children: [
                //      Text("Funds Transfer"),
                //      Icon(Icons.arrow_forward_ios,size: 16,),
                             
                //               ],),
                //                  ),
                //                ),
                //                const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
                //                InkWell(
                //                 onTap: () {
                //                 showModalBottomSheet(
                //                   context: context,
                //                   isDismissible: true,
                //                   isScrollControlled: true,
                //                   enableDrag: true,
                //                   constraints: const BoxConstraints(
                //                     maxHeight: 470,
                //                     maxWidth: 400,
                //                   ),
                //                   useSafeArea: true,
                //                   // shape: RoundedRectangleBorder(
                //                   //   borderRadius: BorderRadius.circular(10.0),
                //                   // ),
                //                   builder: ((context) {
                //                   return bottomSheetDialog2(); 
                //                 }));
                       
                //                 },
                //                  child: const Padding(
                //      padding: EdgeInsets.all(8.0),
                //      child: Row(
                //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //      children: [
                //      Text("Sends Money (Same Bank)"),
                //      Icon(Icons.arrow_forward_ios,size: 16,),
                             
                //               ],),
                //                  ),
                //                ),
                //                const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
                //                InkWell(
                //                 onTap: () {
                       
                //                 },
                //                  child: const Padding(
                //      padding: EdgeInsets.all(8.0),
                //      child: Row(
                //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //      children: [
                //      Text("Fonepay (Inter Bank)"),
                //      Icon(Icons.arrow_forward_ios,size: 16,),
                             
                //               ],),
                //                  ),
                //                ),
                //                const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
                //                InkWell(
                //                 onTap: () {
                       
                //                 },
                //                  child: const Padding(
                //      padding: EdgeInsets.all(8.0),
                //      child: Row(
                //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //      children: [
                //      Text("IPS Transfer"),
                //      Icon(Icons.arrow_forward_ios,size: 16,),
                             
                //               ],),
                //                  ),
                //                ),
                //                const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
                //                InkWell(
                //                 onTap: () {
                //         },
                //                  child: const Padding(
                //      padding: EdgeInsets.all(8.0),
                //      child: Row(
                //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //      children: [
                //      Text("NPS Transfer"),
                //      Icon(Icons.arrow_forward_ios,size: 16,),
                             
                //               ],),
                //                  ),
                //                ),
                //                const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
                //                InkWell(
                //                 onTap: () {
                       
                //                 },
                //                  child: const Padding(
                //      padding: EdgeInsets.all(8.0),
                //      child: Row(
                //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //      children: [
                //      Text("Load Wallets"),
                //      Icon(Icons.arrow_forward_ios,size: 16,),
                             
                //               ],),
                //                  ),
                //                ),
                //                const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
                //                InkWell(
                //                 onTap: () {
                       
                //                 },
                //                  child: const Padding(
                //      padding: EdgeInsets.all(8.0),
                //      child: Row(
                //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //      children: [
                //      Text("Schedule Payments"),
                //      Icon(Icons.arrow_forward_ios,size: 16,),
                             
                //               ],),
                //                  ),
                //                ),
                //               // const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
                //     ],
                //   );
                }),
             ),               
          ],),
      ),
    );
  }
  Widget transactionDialogs() {
    return SimpleDialog(
      surfaceTintColor: Colors.white,
                    backgroundColor: Colors.white,
                    title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Fund Transfer Limits",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
                            IconButton(onPressed: (){
                              Navigator.pop(context);
                            } , icon: const Icon(Icons.close))
                        ],),
                      children: [
                        CircularSeekBar(
                              width: 100,
                              height: 100,
                              progress: 20,
                              minProgress: 0,
                              maxProgress: 200,
                              barWidth: 8,
                              startAngle: 80,
                              sweepAngle: 200,
                              strokeCap: StrokeCap.round,
                              progressColor: Colors.red,
                              trackColor: const Color.fromARGB(166, 194, 192, 192),
                              child: Center(
                                child: ValueListenableBuilder(
                                    valueListenable: _valueNotifier,
                                    builder: (_, double value, __) => const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('1/10', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                                      ],
                                    )),
                              ), 
                              ),
                              const Center(child: Text("Transaction left today",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 61, 60, 60)))),
                                        const Padding(
            padding: EdgeInsets.all(16.0),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),
                Padding(
                  padding: EdgeInsets.only(right:16),
                  child: Text("Rs. 35,000 / 50,000"),
                ),
              ],
            ),
          ),
          LinearPercentIndicator(
            width: 650,
            lineHeight: 8.0,
            animationDuration: 2500,
            percent: 0.7,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.red,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Transferrable Amount",),
                  Padding(
                    padding: EdgeInsets.only(right:16.0),
                    child: Text("Rs. 15,000"),
                  ),
                ],
              ),
          ),
                    const Padding(
            padding: EdgeInsets.all(16.0),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("This Month",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),
                Padding(
                  padding: EdgeInsets.only(right:16),
                  child: Text("Rs. 35,000 / 1,00,000"),
                ),
              ],
            ),
          ),
          LinearPercentIndicator(
            width: 650,
            lineHeight: 8.0,
            animationDuration: 2500,
            percent: 0.3,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.green,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Transferrable Amount",),
                  Padding(
                    padding: EdgeInsets.only(right:16.0),
                    child: Text("Rs. 65,000"),
                  ),
                ],
              ),
          ),
          const Padding(
            padding: EdgeInsets.only(left:16,top:16.0),
            child: Text("Max per Transaction"),
          ),
          const Padding(
             padding: EdgeInsets.only(left:16.0),
             child: Text("Rs. 50,000"),
           ), 
           const Padding(
               padding: EdgeInsets.all(16.0),
               child:  Text("Transaction Fees", style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0)),
             ),
          const Padding(
            padding:  EdgeInsets.only(left: 16,right: 16),
            child:  Column(
              children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("1. Rs. 0 - 1,00,000"),
            ),
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("Rs. 10"),
             ),
             ],),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("1. Rs. 1,00,000 - 10,00,000"),
            ),
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("Rs. 10"),
             ),
             ],),
               Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("1. Rs. 10,00,000 - 100,00,000"),
            ),
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Text("Rs. 100"),
             ),
             ],)
          
            ],),
          ),

                      ],
                    
                    );
  }
Widget bottomSheetDialog(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Fund Transfer Limits",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
              IconButton(onPressed: (){
                Navigator.pop(context);
              } , icon: const Icon(Icons.close))
          ],),
        ),
        Column(
          children: [
            CircularSeekBar(
              width: 80,
              height: 80,
              progress: 20,
              minProgress: 0,
              maxProgress: 200,
              barWidth: 8,
              startAngle: 80,
              sweepAngle: 200,
              strokeCap: StrokeCap.round,
              progressColor: Colors.red,
              trackColor: const Color.fromARGB(166, 194, 192, 192),
              child: Center(
                child: ValueListenableBuilder(
                    valueListenable: _valueNotifier,
                    builder: (_, double value, __) => const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('1/10', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                      ],
                    )),
              ), 
              ),
              const Center(child: Text("Transaction left today",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 61, 60, 60)))),
  
              const Padding(
              padding: EdgeInsets.only(left:8.0,right: 8,top: 16),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Today",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),
                  Text("Rs. 35,000 / 50,000"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4,bottom: 4),
              child: LinearPercentIndicator(
                width: 360,
                lineHeight: 8.0,
                animationDuration: 2500,
                percent: 0.6,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.red,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left:8.0,right: 8,bottom: 8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transferrable Amount",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                    Text("Rs. 15,000",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                  ],
                ),
            ),
             const Padding(
              padding: EdgeInsets.only(left:8.0,right: 8,top: 16),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("This Month",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),
                  Text("Rs. 35,000 / 1,00,000"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4,bottom: 4),
              child: LinearPercentIndicator(
                width: 360,
                lineHeight: 8.0,
                animationDuration: 2500,
                percent: 0.3,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left:8.0,right: 8,bottom: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transferrable Amount",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                    Text("Rs. 65,000",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                  ],
                ),
            ),
            const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
            const Padding(
              padding: EdgeInsets.only(left:8,top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Max per Transaction",style: TextStyle(color: Color.fromARGB(221, 128, 126, 126))),
                ],
              ),
            ),
            const Padding(
              padding:  EdgeInsets.only(left:8.0,bottom: 16,top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Rs. 50,000"),
                ],
              ),
            ),
            const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
            const Padding(
              padding: EdgeInsets.only(left:8.0,top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text("Transaction Fees", style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0)),
              ],),
            ),
  
            const Column(
              children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right:16.0,top: 8,left: 8),
                  child: Text("1. Rs. 0 - 1,00,000"),
                ),
             Padding(
               padding: EdgeInsets.only(right:16.0,top: 8),
               child: Text("Rs. 10"),
             ),
             ],),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right:16.0,top: 8,left: 8),
                  child: Text("2. Rs. 1,00,000 - 10,00,000"),
                ),
             Padding(
               padding: EdgeInsets.only(right:16.0,top: 8),
               child: Text("Rs. 10"),
             ),
             ],),
               Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
              padding: EdgeInsets.only(right:16.0,top: 8,left: 8),
              child: Text("3. Rs. 10,00,000 - 100,00,000"),
            ),
             Padding(
               padding: EdgeInsets.only(right:16.0,top: 8),
               child: Text("Rs. 100"),
             ),
             ],),
            ],),
          ],
        )
      ],
    ),
  );
}
Widget bottomSheetDialog1(){
  return ListView(
    padding: const EdgeInsets.all(16),
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Fund Transfer Limits",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
            IconButton(onPressed: (){
              Navigator.pop(context);
            } , icon: const Icon(Icons.close))
        ],),
      ),
      Column(
        children: [
          CircularSeekBar(
            width: 80,
            height: 80,
            progress: 30,
            minProgress: 0,
            maxProgress: 200,
            barWidth: 8,
            startAngle: 80,
            sweepAngle: 200,
            strokeCap: StrokeCap.round,
            progressColor: Colors.yellow,
            trackColor: const Color.fromARGB(166, 194, 192, 192),
            child: Center(
              child: ValueListenableBuilder(
                  valueListenable: _valueNotifier,
                  builder: (_, double value, __) => const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('3/10', style: TextStyle(color: Color.fromARGB(255, 252, 227, 2),fontWeight: FontWeight.bold),),
                    ],
                  )),
            ), 
            ),
            const Center(child: Text("Transaction left today",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 61, 60, 60)))),

            const Padding(
            padding: EdgeInsets.only(left:8.0,right: 8,top: 16),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),
                Text("Rs. 35,000 / 50,000"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4,bottom: 4),
            child: LinearPercentIndicator(
              width: 360,
              lineHeight: 8.0,
              animationDuration: 2500,
              percent: 0.6,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.yellow,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left:8.0,right: 8,bottom: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Transferrable Amount",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                  Text("Rs. 15,000",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                ],
              ),
          ),
           const Padding(
            padding: EdgeInsets.only(left:8.0,right: 8,top: 16),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("This Month",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),
                Text("Rs. 35,000 / 1,00,000"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4,bottom: 4),
            child: LinearPercentIndicator(
              width: 360,
              lineHeight: 8.0,
              animationDuration: 2500,
              percent: 0.3,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.green,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left:8.0,right: 8,bottom: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Transferrable Amount",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                  Text("Rs. 65,000",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                ],
              ),
          ),
          const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
          const Padding(
            padding: EdgeInsets.only(left:8,top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Max per Transaction",style: TextStyle(color: Color.fromARGB(221, 128, 126, 126))),
              ],
            ),
          ),
          const Padding(
            padding:  EdgeInsets.only(left:8.0,bottom: 16,top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Rs. 50,000"),
              ],
            ),
          ),
          const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
        ],
      )
    ],
  );
}
Widget bottomSheetDialog2(){
  return ListView(
    padding: const EdgeInsets.all(16),
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Fund Transfer Limits",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
            IconButton(onPressed: (){
              Navigator.pop(context);
            } , icon: const Icon(Icons.close))
        ],),
      ),
      Column(
        children: [
          CircularSeekBar(
            width: 80,
            height: 80,
            progress: 200,
            minProgress: 0,
            maxProgress: 200,
            barWidth: 8,
            startAngle: 80,
            sweepAngle: 200,
            strokeCap: StrokeCap.round,
            progressColor: Colors.green,
            trackColor: const Color.fromARGB(166, 194, 192, 192),
            child: Center(
              child: ValueListenableBuilder(
                  valueListenable: _valueNotifier,
                  builder: (_, double value, __) => const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('10/10', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                    ],
                  )),
            ), 
            ),
            const Center(child: Text("Transaction left today",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 61, 60, 60)))),

            const Padding(
            padding: EdgeInsets.only(left:8.0,right: 8,top: 16),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),
                Text("Rs. 0 / 50,000"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4,bottom: 4),
            child: LinearPercentIndicator(
              width: 360,
              lineHeight: 8.0,
              animationDuration: 2500,
              percent: 0.0,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.green,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left:8.0,right: 8,bottom: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Transferrable Amount",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                  Text("Rs. 50,000",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                ],
              ),
          ),
           const Padding(
            padding: EdgeInsets.only(left:8.0,right: 8,top: 16),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("This Month",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black)),
                Text("Rs. 10,000 / 1,00,000"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4,bottom: 4),
            child: LinearPercentIndicator(
              width: 360,
              lineHeight: 8.0,
              animationDuration: 2500,
              percent: 0.3,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.green,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left:8.0,right: 8,bottom: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Transferrable Amount",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                  Text("Rs. 65,000",style: TextStyle(color: Color.fromARGB(221, 102, 101, 101))),
                ],
              ),
          ),
          const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
          const Padding(
            padding: EdgeInsets.only(left:8,top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Max per Transaction",style: TextStyle(color: Color.fromARGB(221, 128, 126, 126))),
              ],
            ),
          ),
          const Padding(
            padding:  EdgeInsets.only(left:8.0,bottom: 16,top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Rs. 50,000"),
              ],
            ),
          ),
          const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),),
        ],
      )
    ],
  );
}

}