import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/change_widgets_provider.dart';
import 'package:todo/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ChangeWidgetsProvider(false),
        ),
      ],
      child: MaterialApp(
          title: 'My Keep',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MainPage()
      ),
    );
  }
}
