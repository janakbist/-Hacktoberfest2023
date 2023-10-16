import 'package:flutter/material.dart';

class StfSliderr extends StatefulWidget{
    const StfSliderr({super.key});


  State<StatefulWidget> createState() => _SliderExample();


}
class _SliderExample extends State<StfSliderr> {
  late double _sliderValue = 20.0;
  late String _selectedItem = "PopUp Box";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Example"),
      ),
      body: Center(child: Column(
        children: [
        Slider(value: _sliderValue,min: 0.0,max: 100.0, onChanged: (value){
          setState(() {
            _sliderValue =value;
          });
        }),
        Text("Slider Value : ${_sliderValue.toInt()} %"),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: PopupMenuButton(onSelected: (value){
            setState(() {
            _selectedItem = value;
          });
          },       itemBuilder: (context) => [
          const PopupMenuItem(
            value: "Item 1",
            child: Text("Item 1"),
          ),
          const PopupMenuItem(
            value: "Item 2",
            child: Text("Item 2"),
          ),
          const PopupMenuItem(
            value: "Item 3",
            child: Text("Item 3"),
          ),
              ],
              child: Text(_selectedItem),),
        )
      ]),),
    );
  }

}