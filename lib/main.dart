import 'package:flutter/material.dart';
import 'homepage.dart';
import 'routes.dart';
import 'createExpense.dart';
import 'expense_json.dart';
import 'futre.dart';

void main() {
  runApp(new MyApp());

//  loadexpenses();
}
class MyApp extends StatelessWidget {
  @override
  var p = Pages();
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Receipta!",

      initialRoute: p.createExpense,
      routes:<String, WidgetBuilder> {
        p.home: (BuildContext context) => HomePage(),
       // p.createExpense : (BuildContext context) => CreateExpense(),
        p.createExpense : (BuildContext context) => TryFuture(),

      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      //home: HomePage(),
    );
  }
}



