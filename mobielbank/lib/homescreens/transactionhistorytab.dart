import 'package:flutter/material.dart';

class TransactionHistoryTab extends StatefulWidget {
  const TransactionHistoryTab({super.key,});

  @override
  State<StatefulWidget> createState() => _TransactionHistoryTab();
}

class _TransactionHistoryTab extends State<TransactionHistoryTab>{
  List<String>salaryDate=["Salary for Jan 2021","Salary for Feb 2021","Salary for March 2021","Salary for April 2021","Salary for july 2021"];

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top:4.0,left: 8,right: 8),
    child: Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: salaryDate.length+1,
        itemBuilder: (context,index){
          if (index == salaryDate.length) {
            return const SizedBox.shrink();
          } else {
            return const Divider(height: 1,color: Color.fromARGB(255, 226, 223, 223),);
          }
        }, separatorBuilder: (context,index){
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(salaryDate[index]),
                    Row(children: [
                      const Text("NPR."),
                      const Text("25,121.12",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz))
                    ],)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top:36,left:12.0,right: 12,bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Jan 01, 2021 at 10:00 AM",style: TextStyle(fontSize: 11,color: Color.fromARGB(255, 131, 129, 129)),),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(children: [
                        Text("Balance NPR.",style: TextStyle(color: Color.fromARGB(255, 131, 129, 129),fontSize: 11,fontWeight: FontWeight.bold),),
                        Text("1,07,680.12",style: TextStyle(color: Color.fromARGB(255, 131, 129, 129),fontSize: 11,fontWeight: FontWeight.bold)),
                      ],),
                    )
                  ],
                ),
              ), 
            ],
          );                            
        }),
    ),
  );
}

}