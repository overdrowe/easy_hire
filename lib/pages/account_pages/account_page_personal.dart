import 'package:easy_hire/app_style/app_style.dart';
import 'package:easy_hire/pages/enter_password_pages/enter_current_password_page.dart';
import 'package:easy_hire/pages/main_pages/main_page_business.dart';
import 'package:easy_hire/singleton/account_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

import '../edit_profile_page/edit_profile_page.dart';

class AccountPagePersonal extends StatefulWidget {
  @override
  _AccountPagePersonalState createState() => _AccountPagePersonalState();
}

class _AccountPagePersonalState extends State<AccountPagePersonal> {
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
              accountTypeSwitch,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      settingBtn(
                        title: "Address",
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
                      // notificationBtn,
                      settingBtn(
                        title: "Notification",
                        src: 'assets/icons/notification.svg',
                        trailing: Text(
                          "",
                          style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: Color(0xFFB6B7B8),
                          ),
                        ),
                        onTap: () {},
                      ),
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
      decoration: AccountData().avatarImageFile != null
          ? BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: FileImage(AccountData().avatarImageFile)),
            )
          : BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF4F4F4)),
      child: AccountData().avatarImageFile != null
          ? Container()
          : Icon(
              Icons.person,
              size: 50,
              color: Color(0xFFE9E9E9),
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
        onTap: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditProfilePage()));
          setState(()  {
          });
        },
      ),
    );
  }

  get notificationBtn {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text("Personal",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      )),
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
                onTap: () {
                  setState(() {
                    AccountData().accountType = AccountType.business;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MainPageBusiness(currentIndex: 3)));
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Business",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Color(0xFF252525),
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
      preferredSize: Size.fromHeight(104.0),
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                avatar,
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      accountName,
                      SizedBox(height: 6),
                      registrationInfo
                    ],
                  ),
                ),
                editButton,
              ],
            ),
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
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
