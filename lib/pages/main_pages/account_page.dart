import 'package:easy_hire/singleton/account_data.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool notificationTune = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              settingBtn(
                title: "Business info",
                icon: Icons.build,
                onTap: () {},
              ),
              settingBtn(
                title: "Location",
                icon: Icons.location_on,
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
                icon: Icons.rate_review,
                trailing: Row(
                  children: [
                    Text(
                      "72",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Color(0xFF42B39B),
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
                icon: Icons.check,
                onTap: () {},
              ),
              notificationBtn,
              settingBtn(
                title: "E-mail",
                icon: Icons.email,
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
                icon: Icons.vpn_key_sharp,
                trailing: Text(
                  "*********",
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    color: Color(0xFFB6B7B8),
                  ),
                ),
                onTap: () {},
              ),
              logOutBtn,
              accountTypeSwitch,
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
          padding: EdgeInsets.all(12),
          child: Icon(Icons.edit_outlined),
        ),
        onTap: () {},
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
            Icon(
              Icons.notifications_sharp,
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
              activeColor: Color(0xFF42B39B),
              value: notificationTune,
              onToggle: (val) {
                setState(() {
                  notificationTune = val;
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
                  ? Color(0xFF42B39B)
                  : Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(6),
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () {
                  setState(() {
                    AccountData().accountType = AccountType.personal;
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
                      fontWeight:
                      AccountData().accountType == AccountType.personal
                          ? FontWeight.bold
                          : FontWeight.normal,
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
                  ? Color(0xFF42B39B)
                  : Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(6),
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () {
                  setState(() {
                    AccountData().accountType = AccountType.business;
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
                      fontWeight:
                          AccountData().accountType == AccountType.business
                              ? FontWeight.bold
                              : FontWeight.normal,
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
      preferredSize: Size.fromHeight(180.0),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
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

  settingBtn(
      {IconData icon, String title, VoidCallback onTap, Widget trailing}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
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
              color: Color(0xFF979797),
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
            Icon(
              Icons.logout,
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
