import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_flutter_app/cardview1.dart';
import 'package:my_flutter_app/cardviewexample.dart';
import 'package:my_flutter_app/formerror.dart';
import 'package:my_flutter_app/gridviewexample.dart';
import 'package:my_flutter_app/listviewexample.dart';
import 'package:my_flutter_app/slider.dart';
import 'package:my_flutter_app/themedata.dart';

// import 'package:my_flutter_app/themedata.dart';
import 'form.dart';
import 'images.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  int _selectedIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if(_counter==2) {
        _counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.menu),
        title: const Text('Page title'),
        actions: const [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      Image.asset('images/abc.png',height: 250,width: 500,fit: BoxFit.contain,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const StfSliderr()));
                        },
                        child: const Text("go to Slider",style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),),
                      )
                    ]),
                  ),
                ),
                // ElevatedButton(
                  
                //   // style: ElevatedButton.styleFrom(
                //   //   backgroundColor: Style.btnColor
                //   // ),
                  
                //   onPressed:  (){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const FormExample()));
                // },
              
                // child: SingleChildScrollView(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Container(
                //       width: 100,
                //       child: Row(children:  [
                //          Icon(Icons.forward),
                //          Text("Form",style: GoogleFonts.getFont('Lato'),),
                //       ]),
                //     ),
                //   ),
                // ),
                // ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(   
                    child: const Text("show list"),          
                    onPressed:  (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  DynamicCardView()));
                  },
                  
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'You have clicked the button this many times',
                  ),
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
            
                ),
                Column(
                  children: [
                    Container(
                      height: 200.0,
                      width: 1000.0,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Column(children: const [
                        Padding(padding: EdgeInsets.all(2),
                        child: Text("Hello World",selectionColor: Colors.green),                    
                        ),
                        Padding(padding: EdgeInsets.all(2),                  
                        child: Text("Flutter Dart",selectionColor: Colors.black,overflow: TextOverflow.clip,),
                        
                        ),

                        ],)
                    )

                  ],
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
           FloatingActionButton(
          
            onPressed:_incrementCounter,
             child: const Icon(Icons.add),
          ),
          
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.red,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value){
            setState(() {
              _selectedIndex = value;
              if(_selectedIndex ==3) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const BgImages()));
                }else if(_selectedIndex==2) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const FormError()));
                  }else if(_selectedIndex==1) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const FormExample()));
                    }else{
                      _selectedIndex ==0;
                      }
                      });
                      },                 
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Account',

          ),
        ],        
      ),
    );// This trailing comma makes auto-formatting nicer for build methods.
  
  }
}
