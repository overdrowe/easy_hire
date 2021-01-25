import 'package:flutter/material.dart';

import 'main_pages/projects_page.dart';
import 'main_pages/work_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  List<Widget> tabs = [
    ProjectsPage(),
    WorkPage(),
    WorkPage(),
    WorkPage(),
    WorkPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF252525),
        unselectedItemColor: Color(0xFFB6B7B8),
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Project",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: "Work",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Help",
          ),
        ],
      ),
    );
  }
}
