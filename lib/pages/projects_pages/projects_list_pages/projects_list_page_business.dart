import 'package:easy_hire/services/account_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../project_page_business.dart';

class ProjectsListPageBusiness extends StatelessWidget {
  getProjects(BuildContext context) {
    List<Widget> widgetList = [];

    for (var value in AccountData().projectsList) {
      widgetList.add(value.getProjectItem(onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProjectPageBusiness(project: value)));
      }));
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Projects in progress",
          style: GoogleFonts.montserrat(
            fontSize: 22,
            letterSpacing: 0.38,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252525),
          ),
        ),
        backgroundColor: Color(0xFFF4F4F4),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: getProjects(context),
          ),
        ),
      ),
    );
  }
}
