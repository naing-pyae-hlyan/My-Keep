import 'package:flutter/material.dart';


Widget bottomIconSheet(BuildContext context) {
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
            onPressed: () {},
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
