import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/ui/utils/app_theme_colors.dart';
import '../../calender_timeline/calendar_timeline.dart';

class TasksListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 19,
          child: CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
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
              itemBuilder: (_, index) => listViewBuilder(context),
              separatorBuilder: (_, index) => SizedBox(height: 20,),
              itemCount: 10,
              physics: BouncingScrollPhysics()
            ),
          ),
        ),
      ],
    );
  }

  Widget listViewBuilder(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: StretchMotion(),
        dragDismissible: false,
        children: [
          SlidableAction(
            onPressed: (context){},
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: AppThemeColors.red,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0),),
          ),
          SlidableAction(
            onPressed: (context){},
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
                  'Play BasketBall',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  '10:30 AM',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: ElevatedButton(
                  onPressed: (){},
                  child: Icon(Icons.check),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder()
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
