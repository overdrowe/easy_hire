import 'package:easy_hire/models/project.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ProjectPage extends StatelessWidget {
  final Project project;

  const ProjectPage({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF4F4F4),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.more_horiz),
            ),
            onTap: () {},
          )
        ],
        iconTheme: IconThemeData(color: Color(0xFF252525)),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            projectTitle,
            SizedBox(height: 12),
            projectTypeAndCost,
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
            Expanded(child: Container()),
            CustomButton(
              title: "Into messages",
              isActive: true,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  get projectNote {
    if (project.note != null)
      return Column(
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
      );
    else
      return Container();
  }

  get projectAdditionally {
    if (project.photos != null)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Additionally",
            style: GoogleFonts.montserrat(
                fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      );
    else
      return Container();
  }

  get projectTitle {
    return Text(
      project.title,
      style: GoogleFonts.montserrat(fontSize: 21, fontWeight: FontWeight.bold),
    );
  }

  get projectDescription {
    return Text(
      project.description ?? "",
      style: GoogleFonts.montserrat(fontSize: 15, color: Color(0xFFB6B7B8)),
    );
  }

  get projectTypeAndCost {
    return Row(
      children: [
        Text(
          "Decoration",
          style:
              GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 4, left: 12, right: 12),
          width: 6,
          height: 6,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xFFB6B7B8)),
        ),
        Text(
          r"Up to $" + project.price.toString(),
          style:
              GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  get address {
    return Row(
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
          style: GoogleFonts.montserrat(fontSize: 12, color: Color(0xFF333333)),
        ),
      ],
    );
  }

  get dateStart {
    if (project.date != null)
      return Row(
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
            style:
                GoogleFonts.montserrat(fontSize: 12, color: Color(0xFF333333)),
          ),
        ],
      );
    else
      return Container();
  }
}
