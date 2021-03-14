import 'package:flutter/material.dart';

class NewQueryPage extends StatefulWidget {
  @override
  _NewQueryPageState createState() => _NewQueryPageState();
}

class _NewQueryPageState extends State<NewQueryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewQuery'),
      ),
      body: ListView(
        children: [QueryHead()],
      ),
      bottomNavigationBar: BottomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class QueryHead extends StatefulWidget {
  @override
  _QueryHeadState createState() => _QueryHeadState();
}

class _QueryHeadState extends State<QueryHead> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
