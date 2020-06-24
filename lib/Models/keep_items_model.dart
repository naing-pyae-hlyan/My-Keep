import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeepItemsModel {
  bool isExpended;
  String title = "";
  String body = "";
  Color color = Colors.white;

  KeepItemsModel(
      {this.isExpended, @required this.title, @required this.body, this.color});
}
