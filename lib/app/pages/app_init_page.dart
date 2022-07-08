// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'widgets/login_widget.dart';

// Widgets


// LoginAndRegisterPage: StatefulWidget Class
class AppInitPage extends StatefulWidget {

  // Constructor
  const AppInitPage({Key? key}) : super(key: key);

  // CreateState: Override Class Method
  @override
  State<AppInitPage> createState() => _AppInitPageState();
}

// _LoginAndRegisterPageState: State Class
class _AppInitPageState extends State<AppInitPage> {
  // Changable: Class Properties
  int _currentIndex = 0;

  // Final: Class Properties
  final List<Map<String, dynamic>> _widgetList = [
    {
      "title": "Login",
      "icon": Icons.manage_accounts,
      "widget": const LoginWidget(),
    },
    /*{
      "title": "Register",
      "icon": Icons.person_add,
      "widget": const RegisterWidget(),
    },*/
  ];

  // Build: Override Class Methods
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        itemPadding: const EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 10.0,
        ),
        currentIndex: _currentIndex,
        onTap: (int changedIndex) {
          setState(() {
            _currentIndex = changedIndex;
          });
        },
        items: _widgetList
            .map(
              (widget) => SalomonBottomBarItem(
                icon: Icon(widget["icon"]),
                title: Text(widget["title"]),
                selectedColor: Colors.lightBlue,
              ),
            )
            .toList(),
      ),
      body: SafeArea(child: _widgetList[_currentIndex]["widget"]),
    );
  }
}
