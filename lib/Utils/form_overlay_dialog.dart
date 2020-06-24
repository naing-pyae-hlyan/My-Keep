import 'package:flutter/material.dart';
import 'package:todo/Interface/keep_inteface.dart';
import 'package:todo/Widgets/common_widgets.dart';

Future<void> showFormOverlayDialog({
  @required BuildContext context,
  KeepCallback callback,
  ColorCallback colorCallback,
}) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          title: _titleField(context),
          content: _bodyField(context),
          actions: <Widget>[
            bottomIconSheet(context: context, colorCallback: colorCallback),
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
                    callback.keepTitle("");
                    Navigator.of(context).pop();
                  },
                )
              ],
            )
          ],
        );
      });
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
