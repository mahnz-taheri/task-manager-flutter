import 'package:fp2/Mod/Task.dart';
class Tasks{

  static List<Task> tasks=List.empty(growable: true);
  static void add(Task task){
    tasks.add(task);
  }

  static List<Task> getTasks(){
    return tasks;
  }
}