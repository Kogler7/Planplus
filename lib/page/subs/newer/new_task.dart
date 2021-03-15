import 'package:flutter/material.dart';
import 'package:flutter_planplus/widgets/para_selector/index.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新建任务'),
      ),
      body: Container(
        child: Column(
          children: [
            TimeSpanSelector(height: 260),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.add), onPressed: (){}),
            IconButton(icon: Icon(Icons.add), onPressed: (){}),
            IconButton(icon: Icon(Icons.add), onPressed: (){}),
            IconButton(icon: Icon(Icons.add), onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
