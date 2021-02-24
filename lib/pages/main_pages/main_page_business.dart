
import 'package:easy_hire/pages/account_pages/account_page_business.dart';
import 'package:easy_hire/pages/help_page/help_page.dart';
import 'package:easy_hire/pages/home_pages/home_page_business.dart';
import 'package:easy_hire/pages/messages_pages/messages_page_business.dart';
import 'package:easy_hire/pages/projects_pages/projects_list_pages/projects_list_page_business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';





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
    HomePageBusiness(),
    ProjectsListPageBusiness(),
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
            selectedItemColor: Color(0xFF0070C2),
            unselectedItemColor: Color(0xFF252525),
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
                      ? Color(0xFF0070C2)
                      : Color(0xFF252525),
                  width: 20,
                  height: 20,),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/work.svg',
                  color: _currentIndex == 1
                      ? Color(0xFF0070C2)
                      : Color(0xFF252525),
                  width: 20,
                  height: 20,),
                label: "Projects",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/chat.svg',
                  color: _currentIndex == 2
                      ? Color(0xFF0070C2)
                      : Color(0xFF252525),
                  width: 20,
                  height: 20,),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/account.svg',
                  color: _currentIndex == 3
                      ? Color(0xFF0070C2)
                      : Color(0xFF252525),
                  width: 20,
                  height: 20,),
                label: "Account",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/help.svg',
                  color: _currentIndex == 4
                      ? Color(0xFF0070C2)
                      : Color(0xFF252525),
                  width: 20,
                  height: 20,),
                label: "Help",
              ),
            ],
          ),
        ));
  }
}
