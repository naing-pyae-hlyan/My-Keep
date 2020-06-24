import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/keep_items_model.dart';
import 'package:todo/Providers/change_widgets_provider.dart';
import 'package:todo/Utils/form_overlay_dialog.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isPressed = true;
  Icon _icon =  Icon(Icons.view_stream);
  int _gridCount = 1;

  void _checkState(){
    if(_isPressed == true){
      _icon = Icon(Icons.view_quilt);
      _gridCount = 2;
    } else {
      _icon = Icon(Icons.view_stream);
      _gridCount = 1;
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
            onPressed: (){
              setState(() {
                _checkState();
              });
            },
            icon: _icon,
          ),
        ],
      ),
      body: _bodyGridView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormOverlayDialog(context: context);
        },
        tooltip: 'New Keep',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _body(BuildContext context){
//    return CustomScrollView(
//      primary: false,
//      slivers: <Widget>[
        return StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) => Container(
              color: Colors.green,
              child: Column(
                children: _getKeepWidgetList(context, _generateKeep(12)),

              ),
            ),
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        );
//      ],
//    );
  }

  List<KeepItemsModel> _generateKeep(int number) {
    return List.generate(number, (int index) {
      return KeepItemsModel(
          title: 'Title $index',
          body:
          'I was very ambitious by all means My true desire was winning forever The top of the rank was in all my dreams Wanting to be the best, the most clever.I was very ambitious by all means My true desire was winning forever The top of the rank was in all my dreams Wanting to be the best, the most clever.');
    });
  }

  Widget _bodyGridView(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
              crossAxisSpacing: 10,
//              mainAxisSpacing: 2,
              crossAxisCount: _gridCount,
              childAspectRatio: 1,
              children: _getKeepWidgetList(context, _generateKeep(20))),
        )
      ],
    );
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
    return Container(
        padding: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 0.0),
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
              height: 12.0,
            ),
            Text('${keep.body}'),
//            Align(
//              alignment: FractionalOffset.bottomCenter,
//              child: bottomIconSheet(context),
//            ),
//            Expanded(
//              child: Align(
//                alignment: FractionalOffset.bottomCenter,
//                child: bottomIconSheet(context),
//              ),
//            )
          ],
        )

//      ExpansionTile(
//        title: Text('${keep.title}'),
//        children: <Widget>[
//          Text('${keep.body}')
//        ],
//      ),
        );
  }
}
