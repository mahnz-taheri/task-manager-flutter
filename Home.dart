import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fp2/Mod/Task.dart';
import 'package:fp2/Mod/Tasks.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  var form_key=GlobalKey<FormState>();
  String title;
  String description;
  String date;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('ToDoList'),
       backgroundColor: Colors.deepPurpleAccent,
     ),
       body: Container(
        child:ListView(
        children: List.generate(Tasks.getTasks().length, (index) {
          var icon = Tasks.getTasks().elementAt(index).getIsdone() ? Icons.check_box: Icons.check_box_outline_blank_sharp;
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
             decoration: BoxDecoration(
               color: Colors.grey,
              border: Border.all(
                color: Colors.black54,
                 width: 1,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: ListTile(
              title: GestureDetector(
                child:Text(Tasks.getTasks().elementAt(index).getTitle(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                ),
                onTap: (){
                  Navigator.pushNamed(context, "/task",arguments: index);
                },
              ),
              leading: GestureDetector(
                child: Icon(icon,
                  color: Colors.lightGreenAccent,
                ),
                onTap: () {
                  setState(() {
                    Tasks.getTasks().elementAt(index).changeisdone();
                  });
                },
              ),
            ),
          );}
        ),
        ),
       ),
        floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add,),
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: (){
          showModalBottomSheet(context: context,
              builder: (context) => Container(
                padding: EdgeInsets.all(12),
                child:Form(
                  key: form_key,
                  child:ListView(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: "Title"),
                        onSaved: (String value){
                          title=value;
                        },
                        validator: (String value){
                          if(value.isEmpty || value == null)
                            return "please enter something";
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Description"),
                         onSaved: (String value) {
                           description = value;
                         },
                        validator: (String value){
                          if(value.isEmpty || value == null)
                            return "please enter something";
                          return null;
                        },
                      ),

                        TextFormField(
                          decoration: InputDecoration(labelText: "Deadline(a day)"),
                          onSaved: (String value) {
                            date = value;
                          },
                          validator: (String value){
                            if(value.isEmpty || value == null)
                              return "please enter something";
                            return null;
                          },
                        ),

                      ElevatedButton(
                        child: Text("add"),
                        onPressed: (){
                          if(form_key.currentState.validate()){
                            setState(() {
                              form_key.currentState.save();
                              Tasks.add(Task(title,description,false,date));
                            });
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  )
                )
              )
          );
          },
    ),
    );
  }
}

