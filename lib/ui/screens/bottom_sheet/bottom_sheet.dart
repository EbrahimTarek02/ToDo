import 'package:flutter/material.dart';
import '../../common/myTextFormField.dart';
import '../../utils/app_theme_colors.dart';

class BottomSheetBuilder extends StatefulWidget {

  @override
  _BottomSheetBuilderState createState() => _BottomSheetBuilderState();
}

class _BottomSheetBuilderState extends State<BottomSheetBuilder> {

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
            'Add New Task',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 20,),
          MyTextFormField(label: 'Enter Your Task Title'),
          SizedBox(height: 10,),
          MyTextFormField(label: 'Enter Your Task Description'),
          SizedBox(height: 20,),
          InkWell(
            onTap: () => openDateTimePicker(),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Time',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppThemeColors.primaryTextColorLight),
                ),
                Text(
                  '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          ElevatedButton(
            onPressed: (){},
            child: Text(
              'Add Task',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 20.0,)
        ],
      ),
    );
  }

  void openDateTimePicker() async{
    selectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ) ?? selectedDate;

    setState(() {

    });
  }
}
