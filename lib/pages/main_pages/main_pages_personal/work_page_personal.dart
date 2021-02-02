import 'package:easy_hire/singleton/account_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../project_page.dart';

class WorkPagePersonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Your project",
          style: GoogleFonts.montserrat(
            fontSize: 22,
            letterSpacing: 0.38,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252525),
          ),
        ),
        backgroundColor: Color(0xFFF4F4F4),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: getProjects(context),
          ),
        ),
      ),
    );
  }

  getProjects(BuildContext context) {
    List<Widget> widgetList = new List();
    for (var value in AccountData().projectsList) {
      widgetList.add(value.getProjectItem(onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProjectPage(project: value)));
      }));
    }
    return widgetList;
  }
}
