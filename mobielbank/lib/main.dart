import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobielbank/cardrequest/cardrequestscreen.dart';
import 'package:mobielbank/bankingview/bankingtabview.dart';

void main() {
    runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 16, 141, 243)),
        useMaterial3: true,
        applyElevationOverlayColor: true,
        bottomSheetTheme: const BottomSheetThemeData(modalBackgroundColor: Colors.white,surfaceTintColor: Colors.white),
      ),
      home: const MyHomePage(title: 'My Limits'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 35,
            child: Container(
              width: 394,
              height: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary ,
                borderRadius: const BorderRadius.only( 
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0),
                  ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom:18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CardRequest()));
                  }, icon: const Icon(Icons.arrow_back),color: Colors.white,),
                  const Center(child: Text("My Limits",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,overflow: TextOverflow.fade),)),
                  const Text("             "),
                ]),
              ),
            ),
          ),
        const Positioned(
          top: 70,
          height: 750,
          width: 370,
          child: Padding(
             padding:  EdgeInsets.all(8.0),
             child: Center(
               child: Card(
                surfaceTintColor: Colors.white,
                 color: Color.fromARGB(255, 255, 255, 255),
                 shadowColor: Colors.white,
                  elevation: 4.0,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Expanded(
                       child: BankingTabView(),
                     ),
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
