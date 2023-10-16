import 'package:flutter/material.dart';

class GridViewExample extends StatefulWidget {
   GridViewExample({super.key});
  
  @override
  State<StatefulWidget> createState() =>_GridView();
  }

class _GridView extends State<GridViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
      ),
      body:  GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //crossAxisCount  represents number grid 
          crossAxisCount: 4,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 200,
              width: 300,
              color: Colors.blue,
              child: Center(
                child: Text('Item $index',style: const TextStyle(color: Colors.white),),
                ),
                );
                },
                itemCount: 100,
)

    );

  }
  
}