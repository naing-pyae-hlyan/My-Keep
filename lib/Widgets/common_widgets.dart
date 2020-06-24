import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:todo/Interface/keep_inteface.dart';

Widget bottomIconSheet({BuildContext context, ColorCallback colorCallback}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.supervisor_account,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {
              _colorPicker(context, colorCallback);
            },
            icon: Icon(
              Icons.color_lens,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.image,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.archive,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey,
            )),
      ],
    ),
  );
}

Future<void> _colorPicker(BuildContext context, ColorCallback callback) async {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          content: MaterialColorPicker(
            shrinkWrap: true,
            onMainColorChange: (Color color) {
              callback.paintColor(color);
            },
            onColorChange: (Color color){
              callback.paintColor(color);
            },
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Paint'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
