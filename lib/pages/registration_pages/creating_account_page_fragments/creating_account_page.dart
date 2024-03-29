import 'package:easy_hire/app_style/app_style.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'handyman_creating_page.dart';
import 'licensed_contractor_creating_page.dart';

class CreatingAccountPage extends StatefulWidget {
  @override
  _CreatingAccountPageState createState() => _CreatingAccountPageState();
}

class _CreatingAccountPageState extends State<CreatingAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Registration"),
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: PreferredSize(
                        preferredSize:
                            Size(MediaQuery.of(context).size.width, 64),
                        child: Container(
                          margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                          child: AppBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            elevation: 0,
                            toolbarHeight: 48,
                            automaticallyImplyLeading: false,
                            backgroundColor: Color(0xFFF4F4F4),
                            bottom: TabBar(
                                unselectedLabelColor: Color(0xFF252525),
                                indicatorSize: TabBarIndicatorSize.tab,
                                labelColor: Colors.white,
                                unselectedLabelStyle: GoogleFonts.montserrat(
                                  fontSize: 15,
                                ),
                                labelStyle: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.24,
                                ),
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppStyle().mainColor),
                                tabs: [
                                  Tab(
                                    child: Text(
                                      "Licensed contractor",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Handyman",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      body: TabBarView(
                          physics: ScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          children: [
                            LicensedContractorCreatingPage(),
                            HandymanCreatingPage(),
                          ]),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
