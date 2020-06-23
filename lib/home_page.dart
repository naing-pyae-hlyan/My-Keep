import 'package:flutter/material.dart';
import 'package:todo/Interface/keep_inteface.dart';
import 'package:todo/Models/keep_items_model.dart';
import 'package:todo/Utils/form_overlay_dialog.dart';

class MainPage extends StatelessWidget {

  List<KeepItemsModel> _generateKeep(int number){
    return List.generate(number, (int index){
      return KeepItemsModel(
       title: 'Title $index',
       body: 'I was very ambitious by all means My true desire was winning forever The top of the rank was in all my dreams Wanting to be the best, the most clever.'
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Keep'),
        centerTitle: true,
      ),
      body: _bodyGridView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: (){showFormOverlayDialog(context: context);},
        tooltip: 'New Keep',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _body(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: _getKeepWidgetList(_generateKeep(20)),
      ),
    );
  }

  Widget _bodyGridView(BuildContext context){
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: _getKeepWidgetList(_generateKeep(20))
          ),
        )
      ],
    );
  }

  List<Widget> _getKeepWidgetList(List<KeepItemsModel> items){
    List<Widget> widgets = List();
    for(KeepItemsModel item in items){
      widgets.add(_getKeepWidget(item));
    }
    return widgets;
  }


  Widget _getKeepWidget(KeepItemsModel keep){
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
       children: <Widget>[
         Flexible(
           child: Text('${keep.title}', style: TextStyle(fontWeight: FontWeight.bold),),
         ),
         SizedBox(
           height: 12.0,
         ),
         Flexible(
           child: Text('${keep.body}'),
         ),
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
