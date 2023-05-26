import 'package:flutter/material.dart';
import 'package:fp2/Mod/Tasks.dart';

class Task{
  String title;
  String description;
  bool isdone;
  String date;

  Task(String title, String description, bool isdone,String date){
    this.title=title;
    this.description=description;
    this.isdone=isdone;
    this.date=date;
  }

  void changeisdone(){
    isdone=!isdone;
  }
  String getTitle(){
    return title;
  }
  String getDescription(){
    return description;
  }
  bool getIsdone(){
    return isdone;
  }
  String getDline(){
    return date;
  }
}

