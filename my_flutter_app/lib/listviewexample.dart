import 'package:flutter/material.dart';
class  ListViewExample extends StatefulWidget{
  const ListViewExample({super.key});
  
  @override
  State<StatefulWidget> createState() => _ListView();
}
class _ListView extends State<ListViewExample> {
   static const numItems = 20;
    static const _biggerFont = TextStyle(fontSize: 18.0);

    Widget _buildRow(int idx) {
      return ListTile(
        leading: CircleAvatar(
          child: Text('$idx'),
        ),
        title: Text(
          'Item $idx',
          style: _biggerFont,
        ),
        trailing: const Icon(Icons.dashboard),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Data"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: numItems * 2,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (BuildContext context, int items) {
              if (items.isEven) return const Divider();
              final index = items ~/ 2 + 1;
              return _buildRow(index);
              },
            ),
          ),
    );
  }

}