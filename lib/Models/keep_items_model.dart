import 'package:flutter/cupertino.dart';

class KeepItemsModel{
  bool isExpended;
  String title, body;
  KeepItemsModel({
    this.isExpended,
    @required this.title,
    @required this.body
});
}