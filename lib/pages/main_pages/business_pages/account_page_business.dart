import 'package:easy_hire/app_builder/app_builder.dart';
import 'package:easy_hire/app_style/app_style.dart';
import 'package:easy_hire/pages/main_pages/edit_user_name_page.dart';
import 'package:easy_hire/pages/main_pages/personal_pages/main_page_personal.dart';
import 'package:easy_hire/singleton/account_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

import '../enter_current_password_page.dart';

class AccountPageBusiness extends StatefulWidget {
  @override
  _AccountPageBusinessState createState() => _AccountPageBusinessState();
}

class _AccountPageBusinessState extends State<AccountPageBusiness> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "accountPage",
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFE9E9E9),
          automaticallyImplyLeading: false,
          title: Text(
            "Account",
            style: GoogleFonts.montserrat(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF252525)),
          ),
          bottom: header,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      settingBtn(
                        title: "Business info",
                        src: 'assets/icons/work.svg',
                        onTap: () {},
                      ),
                      settingBtn(
                        title: "Location",
                        src: 'assets/icons/location.svg',
                        trailing: Text(
                          "8502 Preston Rd. Inglewood...",
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: Color(0xFFB6B7B8),
                          ),
                        ),
                        onTap: () {},
                      ),
                      settingBtn(
                        title: "Reviews",
                        src: 'assets/icons/reviews.svg',
                        trailing: Row(
                          children: [
                            Text(
                              "72",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: AppStyle().mainColor,
                              ),
                            ),
                            Text(
                              "/3",
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                color: Color(0xFF252525),
                              ),
                            )
                          ],
                        ),
                        onTap: () {},
                      ),
                      settingBtn(
                        title: "Completed project",
                        src: 'assets/icons/archive.svg',
                        onTap: () {},
                      ),
                      notificationBtn,
                      settingBtn(
                        title: "E-mail",
                        src: 'assets/icons/mail.svg',
                        trailing: Text(
                          "jackmi...@gmail.com",
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: Color(0xFFB6B7B8),
                          ),
                        ),
                        onTap: () {},
                      ),
                      settingBtn(
                        title: "Password",
                        src: 'assets/icons/password.svg',
                        trailing: Text(
                          "*********",
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: Color(0xFFB6B7B8),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EnterCurrentPasswordPage()));
                        },
                      ),
                      logOutBtn,
                    ],
                  ),
                ),
              ),
              accountTypeSwitch
            ],
          ),
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
      "Handyman" + "   " + "2 years on Easy Hire",
      style: GoogleFonts.montserrat(
        fontSize: 13,
        color: Color(0xFF252525).withOpacity(0.6),
      ),
    );
  }

  get editButton {
    return Material(
      shape: CircleBorder(),
      color: Colors.white,
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Icon(
            Icons.edit_outlined,
            size: 20,
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditUserNamePage()));
        },
      ),
    );
  }

  get notificationBtn {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/notification.svg',
              color: Color(0xFF252525),
            ),
            SizedBox(width: 24),
            Text(
              "Notifications",
              style: GoogleFonts.montserrat(
                fontSize: 17,
                color: Color(0xFF252525),
              ),
            ),
            Expanded(child: SizedBox()),
            FlutterSwitch(
              width: 55.0,
              height: 28.0,
              toggleSize: 18.0,
              activeColor: AppStyle().mainColor,
              value: AccountData().notificationTune,
              onToggle: (val) {
                setState(() {
                  AccountData().notificationTune = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  get accountTypeSwitch {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(6),
      ),
      margin: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: AccountData().accountType == AccountType.personal
                  ? AppStyle().mainColor
                  : Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(6),
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () {
                  setState(() {
                    AccountData().accountType = AccountType.personal;
                    AppBuilder.of(context).rebuild();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MainPagePersonal(currentIndex: 3)));
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Personal",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontWeight:FontWeight.normal,
                      fontSize: 15,
                      color: Color(0xFF252525),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: AccountData().accountType == AccountType.business
                  ? AppStyle().mainColor
                  : Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(6),
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Business",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget accountButtonStyle({String title, VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onTap,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  color: Color(0xFF252525),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  get header {
    return PreferredSize(
      preferredSize: Size.fromHeight(200.0),
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                avatar,
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    accountName,
                    SizedBox(height: 8),
                    registrationInfo
                  ],
                ),
                SizedBox(),
                editButton,
              ],
            ),
            SizedBox(height: 8),
            accountButtonStyle(title: "Contractor license - add", onTap: () {}),
            accountButtonStyle(
                title: "Liability insurance - not provided", onTap: () {}),
          ],
        ),
      ),
    );
  }

  settingBtn({String src, String title, VoidCallback onTap, Widget trailing}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset(
              src,
              color: Color(0xFF252525),
            ),
            SizedBox(width: 24),
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 17,
                color: Color(0xFF252525),
              ),
            ),
            Expanded(child: Container()),
            trailing ?? Container(),
            SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: Color(0xFFE9E9E9),
            ),
          ],
        ),
      ),
    );
  }

  get logOutBtn {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/exit.svg',
              color: Color(0xFFE14949),
            ),
            SizedBox(width: 24),
            Text(
              "Log out",
              style: GoogleFonts.montserrat(
                fontSize: 17,
                color: Color(0xFFE14949),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
