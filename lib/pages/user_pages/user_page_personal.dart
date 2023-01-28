import 'package:easy_hire/pages/dialog_pages/dialog_page_business.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPagePersonal extends StatefulWidget{
  @override
  _UserPagePersonalState createState() => _UserPagePersonalState();
}

class _UserPagePersonalState extends State<UserPagePersonal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF4F4F4),
        leading: backArrow,
        centerTitle: true,
        title: title,
        bottom: header,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          completedProjects,
          activeProjects,
          activeProjectsBtn,
        ],
      ),
    );
  }

  get activeProjectsBtn{
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(top: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "See active project",
                    style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFB6B7B8)),
                  ),
                  Icon(Icons.arrow_forward, size: 13, color: Color(0xFFB6B7B8),)
                ],
              ),
            ),
            SizedBox(height: 12),
            Divider(
              height: 1,
              thickness: 0.5,
            )
          ],
        ),
      ),
    );
  }

  get title {
    return Text(
      "Personal",
      style: GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xFF252525)),
    );
  }

  get backArrow {
    return TextButton(
      style: TextButton.styleFrom(shape: CircleBorder()),
      child: Icon(
        Icons.arrow_back_ios,
        color: Color(0xFF252525),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  get activeProjects {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 12),
      child: Text(
        "Active project — 4",
        style: GoogleFonts.montserrat(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252525)),
      ),
    );
  }
 get completedProjects {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Text(
        "Completed project — 12",
        style: GoogleFonts.montserrat(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252525)),
      ),
    );
  }

  get header {
    return PreferredSize(
      preferredSize: Size.fromHeight(100.0),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            avatar,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                accountName,
                SizedBox(height: 8),
                registrationInfo
              ],
            ),
            SizedBox(),
            dialogButton,
          ],
        ),
      ),
    );
  }

  get avatar {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/image1.jpg'),
        ),
      ),
    );
  }

  get accountName {
    return Text(
      "Brooklyn Simmons",
      style: GoogleFonts.montserrat(
        fontSize: 22,
        color: Color(0xFF252525),
      ),
    );
  }

  get registrationInfo {
    return Text(
      "2 years on Easy Hire",
      style: GoogleFonts.montserrat(
        fontSize: 13,
        color: Color(0xFF252525).withOpacity(0.6),
      ),
    );
  }

  get dialogButton {
    return Material(
      shape: CircleBorder(),
      color: Colors.white,
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(12),
          child: SvgPicture.asset('assets/icons/msg.svg'),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DialogPageBusiness()));
        },
      ),
    );
  }
}
