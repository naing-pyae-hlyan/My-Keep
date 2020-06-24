import 'package:flutter/material.dart';
import 'package:todo/Interface/keep_inteface.dart';
import 'package:todo/Widgets/common_widgets.dart';

class OverlayForm extends StatefulWidget {
  @override
  _OverlayFormState createState() => _OverlayFormState();
}

class _OverlayFormState extends State<OverlayForm> implements ColorCallback{

  Color _color = Colors.white;

  @override
  paintColor(Color color) {
    _color = color;
    print(color);
  }
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: _color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: _titleField(context),
      content: _bodyField(context),
      actions: <Widget>[
        bottomIconSheet(context: context, colorCallback: this),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Save'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        )
      ],
    );
  }

  Widget _titleField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Title',
      ),
    );
  }

  Widget _bodyField(BuildContext context) {
    return TextFormField(
      maxLines: null,
      decoration: InputDecoration(hintText: 'Take a note...'),
    );
  }
}
