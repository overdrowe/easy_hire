import 'package:easy_hire/app_style/app_style.dart';
import 'package:easy_hire/models/project.dart';
import 'package:easy_hire/models/review.dart';
import 'package:easy_hire/singleton/account_data.dart';
import 'package:easy_hire/widgets/action_buttons_block.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProjectPagePersonal extends StatelessWidget {
  final Project project;

  const ProjectPagePersonal(this.project, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF4F4F4),
        actions: [
          InkWell(
            customBorder: CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.more_vert),
            ),
            onTap: () {},
          )
        ],
        iconTheme: IconThemeData(color: Color(0xFF252525)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            projectTitle,
            SizedBox(height: 12),
            projectInfo,
            SizedBox(height: 16),
            projectDescription,
            SizedBox(height: 16),
            address,
            SizedBox(height: 16),
            dateStart,
            SizedBox(height: 16),
            projectAdditionally,
            SizedBox(height: 16),
            projectNote,
            SizedBox(height: 16),
            responses,
          ],
        ),
      ),
    );
  }

  get responses {
    List<Widget> projectsList = [];
    projectsList.add(latestProjectTitle);
    projectsList.addAll([
      reviewItem(AccountData().reviewsList[0]),
      reviewItem(AccountData().reviewsList[1]),
    ]);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, children: projectsList);
  }

  Widget reviewItem(Review review) {
    return Column(
      children: [
        AccountData().reviewsList[1].getReviewWidget(),
        ActionButtonsBlock(secondColor: Color(0xFFF4F4F4)),
      ],
    );
  }

  get latestProjectTitle {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        "Responses",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252525)),
      ),
    );
  }

  get projectNote {
    if (project.note != null)
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "My note",
              style: GoogleFonts.montserrat(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              project.note,
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
          ],
        ),
      );
    else
      return Container();
  }

  get projectAdditionally {
    if (project.photos != null)
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Additionally",
              style: GoogleFonts.montserrat(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    else
      return Container();
  }

  get projectTitle {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Text(
        project.title,
        style:
            GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.bold),
      ),
    );
  }

  get projectDescription {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        project.description ?? "",
        style: GoogleFonts.montserrat(fontSize: 15, color: Color(0xFFB6B7B8)),
      ),
    );
  }

  get projectInfo {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            "Decoration",
            style: GoogleFonts.montserrat(
                fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Container(
            margin: EdgeInsets.only(top: 4, left: 12, right: 12),
            width: 6,
            height: 6,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppStyle().mainColor),
          ),
          project.date != null ? Row(
            children: [
              Text(
                DateFormat("M/dd/yy").format(project.date),
                style: GoogleFonts.montserrat(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.only(top: 4, left: 12, right: 12),
                width: 6,
                height: 6,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: AppStyle().mainColor),
              ),
            ],
          ) : Container(),
          Text(
            r"Up to $" + project.price.toString(),
            style: GoogleFonts.montserrat(
                fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  get address {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            "Address: ",
            style: GoogleFonts.montserrat(
                fontSize: 12,
                color: Color(0xFF252525),
                fontWeight: FontWeight.bold),
          ),
          Text(
            project.address ?? "none",
            style:
                GoogleFonts.montserrat(fontSize: 12, color: Color(0xFF333333)),
          ),
        ],
      ),
    );
  }

  get dateStart {
    if (project.date != null)
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              "Start: ",
              style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: Color(0xFF252525),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat("MMMM d").format(project.date) ?? "none",
              style: GoogleFonts.montserrat(
                  fontSize: 12, color: Color(0xFF333333)),
            ),
          ],
        ),
      );
    else
      return Container();
  }
}
