
import 'package:easy_hire/app_style/app_style.dart';
import 'package:easy_hire/singleton/account_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dialog_page_business.dart';

class MessagesPageBusiness extends StatefulWidget {
  @override
  _MessagesPageBusinessState createState() => _MessagesPageBusinessState();
}

class _MessagesPageBusinessState extends State<MessagesPageBusiness> {

  get openProjectsMessages {
    return Container(
      child: ListView.builder(
          itemCount: AccountData().dialogsList.length,
          itemBuilder: (context, index) {
            return AccountData().dialogsList[index].getDialogItem(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DialogPageBusiness(
                      dialogInfo: AccountData().dialogsList[index],
                    )));
              },
            );
          }),
    );
  }

  get inWorkMessages {
    return Container(
      child: ListView.builder(
          itemCount: AccountData().dialogsList.length,
          itemBuilder: (context, index) {
            return AccountData().dialogsList[index].getDialogItem(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DialogPageBusiness(
                      dialogInfo: AccountData().dialogsList[index],
                    )));
              },
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
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
            body: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Color(0xFFF4F4F4),
                appBar: PreferredSize(
                  preferredSize: Size(MediaQuery.of(context).size.width, 56),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, top: 8, right: 16),
                    child: AppBar(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      elevation: 0,
                      toolbarHeight: 48,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
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
                              color: AppStyle().mainColor),
                          tabs: [
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Open project"),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("In work"),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                body: Container(
                  margin: EdgeInsets.only(top: 16),
                  color: Colors.white,
                  child: TabBarView(
                      physics: ScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      children: [
                        openProjectsMessages,
                        inWorkMessages,
                      ]),
                ),
              ),
            )));
  }
}
