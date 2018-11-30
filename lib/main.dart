import 'package:flutter/material.dart';
import 'homepage.dart';
import 'routes.dart';
import 'createExpense.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  var p = Pages();
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Receipta!",

      initialRoute: p.createExpense,
      routes:<String, WidgetBuilder> {
        p.home: (BuildContext context) => HomePage(),
        p.createExpense : (BuildContext context) => CreateExpense(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      //home: HomePage(),
    );
  }
}



