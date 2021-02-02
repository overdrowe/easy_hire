import 'package:easy_hire/models/msg_dialog.dart';
import 'package:easy_hire/models/project.dart';
import 'package:easy_hire/pages/dialog_page.dart';
import 'package:easy_hire/singleton/account_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../project_page.dart';

class MessagesPagePersonal extends StatefulWidget {
  @override
  _MessagesPagePersonalState createState() => _MessagesPagePersonalState();
}

class _MessagesPagePersonalState extends State<MessagesPagePersonal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Messages",
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
      body: SingleChildScrollView(
        child: projectDialogsList,
      ),
    );
  }

  getProjectTitle(Project project) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProjectPage(
                  project: project,
                )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              project.title,
              style: GoogleFonts.montserrat(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF252525),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: Color(0xFF252525),
            )
          ],
        ),
      ),
    );
  }

  Widget dialogsList({Project project, List<MsgDialog> dialogsList}) {
    List<Widget> widgetsList = new List();
    widgetsList.add(getProjectTitle(project));

    dialogsList.forEach((element) {
      widgetsList.add(element.getDialogItem(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DialogPage(
                        dialogInfo: element,
                      )));
        },
      ));
    });
    return Column(children: widgetsList);
  }

  get projectDialogsList {
    List<Widget> widgtsList = new List();
    AccountData().projectsList.forEach((element) {
      widgtsList.add(dialogsList(
          project: element, dialogsList: AccountData().dialogsList));
    });
    return Column(children: widgtsList);
  }
}
