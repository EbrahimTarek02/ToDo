import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TasksProvider extends ChangeNotifier{
  List<TodoModel> tasks = [];
  DateTime selectedDay = DateTime.now();
  DateTime selectedDate = DateTime.now();

  void getTasks() async{

    tasks.clear();

    if (tasks.isNotEmpty) return;

    CollectionReference tasksCollectionRef = FirebaseFirestore.instance.collection(TodoModel.collectionName);
    QuerySnapshot tasksSnapShot = await tasksCollectionRef.get();

    for (int i = 0; i < tasksSnapShot.docs.length; i++) {
      TodoModel model = TodoModel.fromJson(tasksSnapShot.docs[i].data() as Map<String, dynamic>);
      if(model.date!.toDate().day == selectedDay.day && model.date!.toDate().month == selectedDay.month && model.date!.toDate().year == selectedDay.year)
        tasks.add(model);
    }

    notifyListeners();
  }

  void openDateTimePicker(BuildContext context) async{
    selectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ) ?? selectedDate;

    notifyListeners();
  }
}