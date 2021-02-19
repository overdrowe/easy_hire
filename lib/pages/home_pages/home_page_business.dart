import 'dart:ui';

import 'package:easy_hire/pages/filters_page/filters_page.dart';
import 'package:easy_hire/pages/sort_page/sort_page.dart';
import 'package:easy_hire/singleton/account_data.dart';
import 'package:easy_hire/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../projects_pages/project_page_business.dart';

class HomePageBusiness extends StatefulWidget {
  @override
  _HomePageBusinessState createState() => _HomePageBusinessState();
}

class _HomePageBusinessState extends State<HomePageBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: SearchTextField(
                  onTap: () {
                    setState(() {});
                  },
                )),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: myPopMenu,
                  ),
                )
              ],
            ),
          ],
        ),
        backgroundColor: Color(0xFFF4F4F4),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: getProjects,
          ),
        ),
      ),
    );
  }

  get pageTitle {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: EdgeInsets.all(16),
            child: Text(
              "Projects",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.38,
                  fontSize: 19,
                  color: Color(0xFF252525)),
            )),
        Divider(
          height: 1,
          thickness: 0.5,
          color: Color(0xFFB6B7B8),
        )
      ],
    );
  }

  get getProjects {
    List<Widget> widgetList = new List();
    widgetList.add(pageTitle);

    for (var value in AccountData().projectsList) {
      widgetList.add(value.getProjectItem(onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProjectPageBusiness(
                      project: value,
                    )));
      }));
    }
    return widgetList;
  }

  Widget buttonStyle({String title, VoidCallback onTap}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 17,
                  letterSpacing: -0.41,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF252525),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  get myPopMenu {
    return PopupMenuButton(
        icon: Icon(Icons.tune, color: Color(0xFFB6B7B8)),
        onSelected: (value) {
          if (value == 1)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FiltersPage()));
          else
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SortPage()));
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.tune, color: Color(0xFFB6B7B8)),
                      ),
                      Text('Filter')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.sort, color: Color(0xFFB6B7B8)),
                      ),
                      Text('Sort')
                    ],
                  )),
            ]);
  }
}
