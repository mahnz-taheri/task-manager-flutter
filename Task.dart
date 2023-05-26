import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fp2/Mod/Task.dart';
import 'package:fp2/Mod/Tasks.dart';
class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int index= ModalRoute.of(context).settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(Tasks.getTasks().elementAt(index).getTitle()),
      ),
      body: Center(
      child:Container(
       padding: EdgeInsets.all(35),
        child: Column(
          children: [
           Text("Description:",
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: Text(Tasks.getTasks().elementAt(index).getDescription(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                 ),
              ),
            ),
            Spacer(),
            Text("Deadline:",
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: Text(Tasks.getTasks().elementAt(index).getDline(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("isdone:",
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 35,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Tasks.getTasks().elementAt(index).getIsdone() ? Icons.check_box: Icons.check_box_outline_blank_sharp,
            size: 40,
              color: Colors.green,
            ),
            ]
            ),
            Spacer(),

          ],
        ),
      ),
      ),
    );
  }
}
