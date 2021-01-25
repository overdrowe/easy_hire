import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../creating_account_page_fragments/handyman_creating_page.dart';
import '../creating_account_page_fragments/licensed_contractor_creating_page.dart';

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
                            Size(MediaQuery.of(context).size.width, 56),
                        child: Container(
                          padding: EdgeInsets.only(left: 16, top: 8, right: 16),
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
                                labelColor: Color(0xFF252525),
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
                                    color: Color(0xFF42B39B)),
                                tabs: [
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Licensed contractor"),
                                    ),
                                  ),
                                  Tab(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text("Handyman"),
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
                            // SizedBox(height: 100,
                            //   child: ColoredBox(color: Colors.red,),),
                            // SizedBox(height: 100,
                            //   child: ColoredBox(color: Colors.red,),)
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
