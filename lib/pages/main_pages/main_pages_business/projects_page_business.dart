import 'dart:ui';

import 'package:easy_hire/singleton/account_data.dart';
import 'package:easy_hire/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../filters_page.dart';
import '../../project_page.dart';
import '../../sort_page.dart';

class ProjectsPageBusiness extends StatefulWidget {
  @override
  _ProjectsPageBusinessState createState() => _ProjectsPageBusinessState();
}

class _ProjectsPageBusinessState extends State<ProjectsPageBusiness> {
  bool searchMode = false;

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
                builder: (context) => ProjectPage(
                      project: value,
                    )));
      }));
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: searchMode ? 120 : 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(child: SearchTextField(
                  onTap: () {
                    setState(() {
                      searchMode = true;
                    });
                  },
                )),
                !searchMode
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FiltersPage()));
                              },
                              child: Container(
                                  padding: EdgeInsets.all(13),
                                  child: Icon(
                                    Icons.tune,
                                    color: Color(0xFFB6B7B8),
                                  )),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            searchMode
                ? Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        sortButton,
                        SizedBox(width: 8),
                        filterButton,
                      ],
                    ),
                  )
                : Container(),
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

  get filterButton {
    return buttonStyle(
        title: "Filter",
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FiltersPage()));
        });
  }

  get sortButton {
    return buttonStyle(
        title: "Sort",
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SortPage()));
        });
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
}
