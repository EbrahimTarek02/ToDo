import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import '../../common/myTextFormField.dart';
import '../../utils/app_theme_colors.dart';

class EditTaskScreen extends StatefulWidget {
  static final String routeName = 'edit';

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {

  late TasksProvider provider;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool built = false;


  @override
  Widget build(BuildContext context) {

    provider = Provider.of(context);

    TodoModel arguments = ModalRoute.of(context)!.settings.arguments as TodoModel;
    if (!built){
      titleController.text = arguments.title.toString();
      descriptionController.text = arguments.description.toString();
      provider.selectedDate = arguments.date!.toDate();
      built = true;
    }

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 25,
              child: Container(
                color: AppThemeColors.primary,
              ),
            ),
            Expanded(
              flex: 75,
              child: Container(
                color: AppThemeColors.scaffoldBackgroundLight,
              ),
            ),
          ],
        ),

        Scaffold(
          backgroundColor: AppThemeColors.transparent,
          appBar: AppBar(
            title: Text('To Do List'),
            toolbarHeight: MediaQuery.of(context).size.height * 0.11,
          ),

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
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
                          'Edit Task',
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
                          onPressed: () => editTask(arguments),
                          child: Text(
                            'Edit Task',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(height: 20.0,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  editTask(TodoModel arguments) {
    CollectionReference tasksRef = FirebaseFirestore.instance.collection(TodoModel.collectionName);
    DocumentReference taskRef = tasksRef.doc(arguments.id);
    taskRef.update({
      "title" : titleController.text,
      "description" : descriptionController.text,
      "date" : provider.selectedDate,
    }).timeout(
      Duration(milliseconds: 200),
      onTimeout: () {
        provider.getTasks();
        Navigator.pop(context);
      }
    );

  }
}
