import 'package:flutter/material.dart';

import 'account_page_business.dart';
import '../help_page.dart';
import 'messages_page_business.dart';
import 'projects_page_business.dart';
import 'work_page_business.dart';

class MainPageBusiness extends StatefulWidget {
  final int currentIndex;

  const MainPageBusiness({Key key, this.currentIndex}) : super(key: key);

  @override
  _MainPageBusinessState createState() => _MainPageBusinessState();
}

class _MainPageBusinessState extends State<MainPageBusiness> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex ?? 0;
  }

  List<Widget> tabs = [
    ProjectsPageBusiness(),
    WorkPageBusiness(),
    MessagesPageBusiness(),
    AccountPageBusiness(),
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
        )
    );
  }
}
