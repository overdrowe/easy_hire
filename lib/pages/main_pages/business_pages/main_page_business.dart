import 'package:easy_hire/pages/main_pages/personal_pages/home_page_personal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'account_page_business.dart';
import '../help_page.dart';
import 'messages_page_business.dart';
import 'work_page_business.dart';

import 'projects_page_business.dart';



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
    HomePage(),
    WorkPageBusiness(),
    MessagesPageBusiness(),
    AccountPageBusiness(),
    HelpPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: Hero(
          tag: "NavigationBar",
          child: BottomNavigationBar(
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
                icon: SvgPicture.asset('assets/icons/home.svg',
                    color: _currentIndex == 0
                        ? Color(0xFF252525)
                        : Color(0xFFBEBEBE)),
                label: "Project",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/work.svg',
                    color: _currentIndex == 1
                        ? Color(0xFF252525)
                        : Color(0xFFBEBEBE)),                label: "Work",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/chat.svg',
                    color: _currentIndex == 2
                        ? Color(0xFF252525)
                        : Color(0xFFBEBEBE)),                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/account.svg',
                    color: _currentIndex == 3
                        ? Color(0xFF252525)
                        : Color(0xFFBEBEBE)),                label: "Account",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/help.svg',
                    color: _currentIndex == 4
                        ? Color(0xFF252525)
                        : Color(0xFFBEBEBE)),                label: "Help",
              ),
            ],
          ),
        ));
  }
}
