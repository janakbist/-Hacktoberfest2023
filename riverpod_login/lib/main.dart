import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/contolller/userdatacontroller.dart';
import 'package:flutter_login/helperclass.dart';
import 'package:flutter_login/home.dart';
import 'package:flutter_login/loginsignup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
   MyApp({super.key});
  final userDataController = Get.put(DataHelper());
  final UserDataController udc = Get.put(UserDataController());
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        // primaryColor: Colors.white
        
      ),
      home: const MyHomePage(title: 'Login Page'),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/homepage', page: () => const HomePage(),transition: Transition.zoom),
      ],

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 148, 235),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        // child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
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
           const Padding(
              padding: EdgeInsets.only(left:88.0,top: 40,right: 60),
              child: Text("Enter your credentials to access your account.",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white ),),
            ),
            const SizedBox(
              height: 650,
              width: 600,
              child: LoginSignupTabView(),
            )         
          ],
        // ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
