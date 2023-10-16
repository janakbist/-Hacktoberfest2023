import 'package:flutter/material.dart';

class CardViewExample extends StatefulWidget {
  const CardViewExample({super.key});
  
  @override
  State<StatefulWidget> createState() => _CardView();

}

class _CardView extends State<CardViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CardView"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            
            child:  Card(
              clipBehavior: Clip.hardEdge,
              elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(child: Text('Outlined Card')),
            ),
            ),
            
          ),
        ],
      )
    );
  }

}