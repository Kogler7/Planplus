import 'package:flutter/material.dart';
import '../list_page.dart';
import 'package:flutter_planplus/model/index.dart';

class ModelListPage extends StatefulWidget {
  @override
  _ModelListPageState createState() => _ModelListPageState();
}

class _ModelListPageState extends State<ModelListPage> {
  @override
  Widget build(BuildContext context) {
    return ListPage(groups: KGroupBase.modelGroups);
  }
}
