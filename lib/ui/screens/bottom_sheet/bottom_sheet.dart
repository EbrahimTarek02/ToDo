import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import '../../common/myTextFormField.dart';
import '../../utils/app_theme_colors.dart';

class BottomSheetBuilder extends StatefulWidget {

  String headerText, buttonText;
  BottomSheetBuilder({required this.headerText, required this.buttonText});

  @override
  _BottomSheetBuilderState createState() => _BottomSheetBuilderState(headerText: headerText, buttonText: buttonText);
}

class _BottomSheetBuilderState extends State<BottomSheetBuilder> {

  String headerText, buttonText;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  _BottomSheetBuilderState({required this.headerText, required this.buttonText});

  late TasksProvider provider;

  @override
  Widget build(BuildContext context) {

    provider = Provider.of(context);

    return Padding(
      padding: EdgeInsets.only(
          top: 20.0,
          right: 20.0,
          left: 20.0,
          bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Text(
            headerText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 20,),
          MyTextFormField(label: 'Enter Your Task Title', controller: titleController,),
          SizedBox(height: 10,),
          MyTextFormField(label: 'Enter Your Task Description', controller: descriptionController,),
          SizedBox(height: 20,),
          InkWell(
            onTap: () => provider.openDateTimePicker(context),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Date',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppThemeColors.primaryTextColorLight),
                ),
                Text(
                  '${provider.selectedDate.day}-${provider.selectedDate.month}-${provider.selectedDate.year}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          ElevatedButton(
            onPressed: () => addTaskToFirebase(),
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 20.0,)
        ],
      ),
    );
  }

  void addTaskToFirebase() {
    CollectionReference todosCollectionRef =  FirebaseFirestore.instance.collection(TodoModel.collectionName);

    DocumentReference emptyDocumentRef =  todosCollectionRef.doc();

    emptyDocumentRef.set({
      'id' : emptyDocumentRef.id,
      'title' : titleController.text,
      'description' : descriptionController.text,
      'date' : provider.selectedDate,
      'isDone' : false,
    }).timeout(
      Duration(milliseconds: 300),
      onTimeout: () {
        provider.getTasks();
        Navigator.pop(context);
      },
    );
  }
}
