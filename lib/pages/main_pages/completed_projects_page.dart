import 'package:easy_hire/singleton/account_data.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'business_pages/project_page_business.dart';

class CompletedProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Completed project", automaticallyImplyActions: false),
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
                builder: (context) => ProjectPageBusiness(project: value)));
      }));
    }
    return widgetList;
  }
}
