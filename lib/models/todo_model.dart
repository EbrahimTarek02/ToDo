import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String? id, title, description;
  Timestamp? date;
  bool? isDone;

  static final String collectionName = 'todos';

  TodoModel({required this.id, required this.title, required this.description, required this.date, required this.isDone});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    date = json['date'];
    isDone = json['isDone'];
  }

}