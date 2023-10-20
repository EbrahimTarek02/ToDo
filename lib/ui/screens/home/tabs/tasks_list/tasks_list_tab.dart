import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/ui/screens/edit_task/edit_task_screen.dart';
import 'package:todo_app/ui/utils/app_theme_colors.dart';
import '../../../../../models/todo_model.dart';
import '../../../../calender_timeline/src/calendar_timeline.dart';

class TasksListTab extends StatefulWidget {

  @override
  State<TasksListTab> createState() => _TasksListTabState();
}

class _TasksListTabState extends State<TasksListTab> {

  late TasksProvider provider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {

    provider = Provider.of(context);

    return Column(
      children: [
        Expanded(
          flex: 19,
          child: CalendarTimeline(
            initialDate: provider.selectedDay,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              provider.selectedDay = date;
              provider.getTasks();
            },
            leftMargin: 20,
            monthColor: AppThemeColors.primaryTextColorLight,
            dayColor: AppThemeColors.primaryTextColorLight,
            activeDayColor: AppThemeColors.primary,
            activeBackgroundDayColor: AppThemeColors.accentLight,
            dotsColor: AppThemeColors.transparent,
            // locale: 'ar',
          ),
        ),

        Expanded(
          flex: 81,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
              itemBuilder: (_, index) => listViewBuilder(context, provider.tasks[index]),
              separatorBuilder: (_, index) => SizedBox(height: 20,),
              itemCount: provider.tasks.length,
              physics: BouncingScrollPhysics()
            ),
          ),
        ),
      ],
    );

  }

  Widget listViewBuilder(BuildContext context, TodoModel task) {

    return Slidable(
      startActionPane: ActionPane(
        motion: StretchMotion(),
        dragDismissible: false,
        children: [
          SlidableAction(
            onPressed: (context) => deleteTask(task),
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: AppThemeColors.red,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0),),
          ),
          SlidableAction(
            onPressed: (context) => Navigator.pushNamed(context, EditTaskScreen.routeName, arguments: TodoModel(id: task.id, title: task.title, description: task.description, date: task.date, isDone: task.isDone)),
            icon: Icons.edit,
            label: 'Edit',
            backgroundColor: AppThemeColors.primary,
          ),
        ],
      ),

      child: Container(
        padding: EdgeInsetsDirectional.only(start: 20.0),
        decoration: BoxDecoration(
          color: AppThemeColors.accentLight,
          borderRadius: BorderRadius.circular(20.0),
        ),

        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                color: AppThemeColors.primary,
                width: 3,
              ),
            ),
            Expanded(
              flex: 99,
              child: ListTile(
                title: Text(
                  task.title.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  '${task.date!.toDate().year}-${task.date!.toDate().month}-${task.date!.toDate().day}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: ElevatedButton(
                  onPressed: () => onDonePressed(task),
                  child: task.isDone! ?
                            Text(
                              'Done!',
                              style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 20
                              ),
                            ) :
                            Icon(Icons.check) ,
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    elevation: 0.0,
                    backgroundColor: task.isDone! ?
                        AppThemeColors.accentLight :
                        AppThemeColors.primary
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  deleteTask(TodoModel task) async{
    CollectionReference tasksRef = FirebaseFirestore.instance.collection(TodoModel.collectionName);
    await tasksRef.doc(task.id).delete().timeout(
        Duration(milliseconds: 200),
        onTimeout: () => provider.getTasks()
    );
  }

  onDonePressed(TodoModel task) {
    CollectionReference tasksRef = FirebaseFirestore.instance.collection(TodoModel.collectionName);
    DocumentReference taskRef = tasksRef.doc(task.id);
    taskRef.update({
      "isDone" : !task.isDone!,
    }).timeout(
        Duration(milliseconds: 200),
        onTimeout: () {
          provider.getTasks();
        }
    );
  }

}
