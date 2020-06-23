import 'package:flutter/material.dart';
import 'package:todo/Interface/keep_inteface.dart';

Future<void> showFormOverlayDialog({
  @required BuildContext context,
  KeepCallack callback,
}) async {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          title: _titleField(context),
          content: _bodyField(context),
          actions: <Widget>[
            _bottomSheet(context),
            FlatButton(
              child: Text('Save'),
              onPressed: () {
                callback.keepTitle("");
                Navigator.of(context).pop();
              },
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

Widget _bottomSheet(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Icon(
        Icons.notifications,
        color: Colors.grey,
      ),
      Icon(
        Icons.supervisor_account,
        color: Colors.grey,
      ),
      Icon(
        Icons.color_lens,
        color: Colors.grey,
      ),
      Icon(
        Icons.image,
        color: Colors.grey,
      ),
      Icon(
        Icons.archive,
        color: Colors.grey,
      ),
      Icon(
        Icons.more_vert,
        color: Colors.grey,
      ),
      Icon(
        Icons.undo,
        color: Colors.grey,
      ),
      Icon(
        Icons.redo,
        color: Colors.grey,
      ),
    ],
  );
}
