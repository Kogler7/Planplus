import 'package:flutter/material.dart';
import '../list_page.dart';
import 'package:flutter_planplus/model/index.dart';

class QueryListPage extends StatefulWidget {
  @override
  _QueryListPageState createState() => _QueryListPageState();
}

class _QueryListPageState extends State<QueryListPage> {
  @override
  Widget build(BuildContext context) {
    return ListPage(groups: KGroupBase.queryGroups);
  }
}
