import 'file:///B:/FlutterProjects/easy_hire/lib/pages/main_pages/help_page.dart';
import 'package:easy_hire/pages/main_pages/main_pages_business/projects_page_business.dart';
import 'package:easy_hire/pages/main_pages/main_pages_personal/work_page_personal.dart';
import 'package:flutter/material.dart';

import 'account_page_personal.dart';
import 'messages_page_personal.dart';

class MainPagePersonal extends StatefulWidget {
  final int currentIndex;

  const MainPagePersonal({Key key, this.currentIndex}) : super(key: key);

  @override
  _MainPagePersonalState createState() => _MainPagePersonalState();
}

class _MainPagePersonalState extends State<MainPagePersonal> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex ?? 0;
  }

  List<Widget> tabs = [
    ProjectsPageBusiness(),
    WorkPagePersonal(),
    MessagesPagePersonal(),
    AccountPagePersonal(),
    HelpPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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
        ));
  }
}
