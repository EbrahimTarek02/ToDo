import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/bottom_sheet/bottom_sheet.dart';
import 'package:todo_app/ui/tabs/settings/settings_tab.dart';
import 'package:todo_app/ui/tabs/tasks_list/tasks_list_tab.dart';
import 'package:todo_app/ui/utils/app_theme_colors.dart';

class HomeScreen extends StatefulWidget {

  static final String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  List<Widget> screens = [
    TasksListTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
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

          bottomNavigationBar: bottomNavBarBuilder(),

          floatingActionButton: floatingActionButtonBuilder(),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          body: screens[currentIndex],
        ),
      ],
    );
  }

  Widget bottomNavBarBuilder() {
    return BottomAppBar(
      notchMargin: 10.0,
      clipBehavior: Clip.hardEdge,

      child: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (newIndex){
          currentIndex = newIndex;
          setState(() {});
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: ''
          ),
        ],
      ),
    );
  }

  Widget floatingActionButtonBuilder() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,

            builder: (_) => BottomSheetBuilder()
        );
      },

      child: Icon(Icons.add),
    );
  }
}
