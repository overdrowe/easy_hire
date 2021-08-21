import 'package:easy_hire/app_style/app_style.dart';
import 'package:easy_hire/pages/dialog_pages/dialog_page_business.dart';
import 'package:easy_hire/services/account_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPageBusiness extends StatefulWidget {
  @override
  _UserPageBusinessState createState() => _UserPageBusinessState();
}

class _UserPageBusinessState extends State<UserPageBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF4F4F4),
        leading: backArrow,
        bottom: header,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            reviewTitle,
            reviews,
            latestProjects,
          ],
        ),
      ),
    );
  }

  get latestProjectTitle {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 4),
      child: Text(
        "Latest Project",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252525)),
      ),
    );
  }

  get latestProjects {
    List<Widget> projectsList = [];
    projectsList.add(latestProjectTitle);
    projectsList.addAll([
      AccountData()
          .projectsList[1]
          .getProjectItem(automaticallyImplyDivider: false),
      AccountData()
          .projectsList[1]
          .getProjectItem(automaticallyImplyDivider: false),
    ]);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, children: projectsList);
  }

  get reviews {
    List<Widget> widgetsList = [];
    widgetsList.addAll([
      AccountData().reviewsList[0].getReviewWidget(),
      AccountData().reviewsList[1].getReviewWidget()
    ]);
    return Column(children: widgetsList);
  }

  get backArrow {
    return FlatButton(
      shape: CircleBorder(),
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: Color(0xFF252525),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  get reviewTitle {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 4),
      child: Row(
        children: [
          Text(
            "Reviews",
            style: GoogleFonts.montserrat(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF252525)),
          ),
          SizedBox(width: 8),
          SvgPicture.asset(
            'assets/icons/like.svg',
            width: 15,
            height: 15,
          ),
          SizedBox(width: 4),
          Text(
            "72",
            style:
                GoogleFonts.montserrat(fontSize: 13, color: AppStyle().mainColor),
          ),
          SizedBox(width: 8),
          SvgPicture.asset(
            'assets/icons/dislike.svg',
            width: 15,
            height: 15,
          ),
          SizedBox(width: 4),
          Text(
            "3",
            style:
                GoogleFonts.montserrat(fontSize: 13, color: Color(0xFF252525)),
          ),
          Expanded(child: SizedBox()),
          InkWell(
            customBorder: CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/icons/sort.svg',
              ),
            ),
            onTap: () {},
          )
        ],
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
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: avatar,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [accountName, SizedBox(height: 8), registrationInfo],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: dialogButton,
            ),
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
    return Row(
      children: [
        Text(
          "Handyman",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Color(0xFF252525).withOpacity(0.6),
          ),
        ),
        SizedBox(width: 8),
        Text(
          "2 years on Easy Hire",
          style: GoogleFonts.montserrat(
            fontSize: 13,
            color: Color(0xFF252525).withOpacity(0.6),
          ),
        ),
      ],
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DialogPageBusiness()));
        },
      ),
    );
  }
}
