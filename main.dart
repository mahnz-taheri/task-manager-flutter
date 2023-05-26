import 'package:flutter/material.dart';
import 'package:fp2/Mod/Task.dart';
import 'package:fp2/Mod/Tasks.dart';
import 'package:fp2/Scrs/Home.dart';
import 'package:fp2/Scrs/Task.dart';
void main() {
  Tasks.add(Task(
    "title 1",
    "desc 1",
    false,
    "1/1/1380",
  ));
  Tasks.add(Task(
    "title 2",
    "desc 2",
    false,
    "2/2/1230",
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/":(context) => Home(),
        "/task":(context)=>TaskPage(),
      },
    );
  }
}
