import 'package:flutter/material.dart';
import 'package:todo/Models/keep_items_model.dart';
import 'package:todo/Utils/form_overlay_dialog.dart';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isPressed = true;
  Icon _icon = Icon(Icons.view_stream);
  int _gridCount = 2;

  void _checkWidgetState() {
    if (_isPressed == true) {
      _icon = Icon(Icons.view_quilt);
      _gridCount = 1;
    } else {
      _icon = Icon(Icons.view_stream);
      _gridCount = 2;
    }
    _isPressed = !_isPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Keep'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                _checkWidgetState();
              });
            },
            icon: _icon,
          ),
        ],
      ),
      body: _bod(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormOverlayDialog(context: context);
        },
        tooltip: 'New Keep',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _bod(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / (_gridCount == 1 ? 8 : 4);
    final double itemWidth = size.width / 2;

    return Container(
      child: GridView.count(
        reverse: true,
          childAspectRatio: itemWidth / itemHeight,
          shrinkWrap: true,
          crossAxisCount: _gridCount,
          children: _getKeepWidgetList(context, _generateKeep(12))),
    );
  }

  List<KeepItemsModel> _generateKeep(int number) {
    return List.generate(number, (int index) {
      return KeepItemsModel(
          title: 'Title $index',
          body:
              'I was very ambitious by all means My true desire was winning forever The top of the rank was in all my dreams Wanting to be the best, the most clever.I was very ambitious by all means My true desire was winning forever The top of the rank was in all my dreams Wanting to be the best, the most clever.');
    });
  }

  List<Widget> _getKeepWidgetList(
      BuildContext context, List<KeepItemsModel> items) {
    List<Widget> widgets = List();
    for (KeepItemsModel item in items) {
      widgets.add(_getKeepWidget(context, item));
    }
    return widgets;
  }

  Widget _getKeepWidget(BuildContext context, KeepItemsModel keep) {
    return GestureDetector(
      onTap: (){print('on Tap ${keep.title}');},
      onLongPress: (){print('Long Press'); HapticFeedback.vibrate();},
      child: Container(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 4.0),
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.black26, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: <Widget>[
              Text(
                '${keep.title}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4.0,
              ),
              Expanded(
                child:
                Text('${keep.body}', overflow: TextOverflow.ellipsis, maxLines: 8,),
              ),
            ],
          )),
    );
  }
}
