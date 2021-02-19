import 'package:easy_hire/custom_clippers/my_clipper.dart';
import 'file:///B:/FlutterProjects/easy_hire/lib/pages/handyman_service_page/handyman_service_page.dart';
import 'file:///B:/FlutterProjects/easy_hire/lib/pages/project_creation_page/project_creation_page.dart';
import 'package:easy_hire/singleton/account_data.dart';
import 'package:easy_hire/widgets/ripple_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../search_page/search_page.dart';

class HomePagePersonal extends StatefulWidget {
  @override
  _HomePagePersonalState createState() => _HomePagePersonalState();
}

enum ServiceSet { handyman, clearing }

class _HomePagePersonalState extends State<HomePagePersonal> {
  ServiceSet currentSet = ServiceSet.handyman;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0070C2),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Positioned(
                  top: 100,
                  child: Container(
                    color: Colors.white,
                    child: SizedBox(
                      height: 20000,
                      width: 10000,
                    ),
                  )),
              pageTitle,
              pageBody,
            ],
          ),
        ),
      ),
    );
  }

  get customProjectBtn {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          gradient: new LinearGradient(
            colors: [
              const Color(0xFF2DA2F8),
              const Color(0xFF0070C2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProjectCreationPage()));
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Text(
                      "Create custom project",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.41,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Color(0xFF252525),
                      ),
                    ),
                    Text(
                      "Create custom project",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.41,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  get searchBtn {
    return Container(
      margin: EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
        gradient: new LinearGradient(
          colors: [
            const Color(0xFF2DA2F8),
            const Color(0xFF0070C2),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Material(
        shape: CircleBorder(),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchPage()));
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  get fstBlock {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular((30))),
      child: Column(
        children: [
          fstBlockBtns,
          categoriesField,
        ],
      ),
    );
  }

  get sndBlock {
    return Container(
      margin: EdgeInsets.only(left: 9, right: 9),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Column(
        children: [
          flatRateFieldTitle,
          sndBlockBtns,
          currentSet == ServiceSet.handyman
              ? handymanServicesField
              : clearingServicesField,
        ],
      ),
    );
  }

  get handymanServicesField {
    return GridView.count(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 15),
      crossAxisCount: (MediaQuery.of(context).size.width / 170).toInt(),
      crossAxisSpacing: 19,
      mainAxisSpacing: 19,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        getServiceItem(
          title: 'Appliances Service and Installation',
          src: 'assets/icons/washer.svg',
          onTap: () {},
        ),
        getServiceItem(
          title: 'Fences and Gates',
          src: 'assets/icons/fence.svg',
          onTap: () {},
        ),
        getServiceItem(
          title: 'Appliances Service and Installation',
          src: 'assets/icons/washer.svg',
          onTap: () {},
        ),
        getServiceItem(
          title: 'Fences and Gates',
          src: 'assets/icons/fence.svg',
          onTap: () {},
        ),
        getServiceItem(
          title: 'Fences and Gates',
          src: 'assets/icons/fence.svg',
          onTap: () {},
        ),
        getServiceItem(
          title: 'Appliances Service and Installation',
          src: 'assets/icons/washer.svg',
          onTap: () {},
        ),
      ],
    );
  }

  get clearingServicesField {
    return GridView.count(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 15),
      crossAxisCount: (MediaQuery.of(context).size.width / 170).toInt(),
      crossAxisSpacing: 19,
      mainAxisSpacing: 19,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        getServiceItem(
          title: 'Appliances Service and Installation',
          src: 'assets/icons/washer.svg',
          onTap: () {},
        ),
        getServiceItem(
          title: 'Appliances Service and Installation',
          src: 'assets/icons/washer.svg',
          onTap: () {},
        ),
        getServiceItem(
          title: 'Appliances Service and Installation',
          src: 'assets/icons/washer.svg',
          onTap: () {},
        ),
        getServiceItem(
          title: 'Appliances Service and Installation',
          src: 'assets/icons/washer.svg',
          onTap: () {},
        ),
        getServiceItem(
          title: 'Appliances Service and Installation',
          src: 'assets/icons/washer.svg',
          onTap: () {},
        ),
      ],
    );
  }

  get sndBlockBtns {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          currentSet == ServiceSet.handyman
              ? sndBlockBtnActive(title: "Handyman Services")
              : sndBlockBtnNotActive(title: "Handyman Services"),
          SizedBox(width: 16),
          currentSet == ServiceSet.clearing
              ? sndBlockBtnActive(title: "Clearing Services")
              : sndBlockBtnNotActive(title: "Clearing Services"),
        ],
      ),
    );
  }

  Widget sndBlockBtnActive({String title}) {
    return Expanded(
      child: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.5),
                gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF2DA2F8),
                    const Color(0xFF0070C2),
                  ],
                  begin: Alignment(-1.0, -2.0),
                  end: Alignment(1.0, 2.0),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.5),
              gradient: new LinearGradient(
                colors: [
                  const Color(0xFF2DA2F8),
                  const Color(0xFF0070C2),
                ],
                begin: Alignment(-1.0, -2.0),
                end: Alignment(1.0, 2.0),
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 12.11,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.29,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Color(0xFF252525),
                      ),
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 12.11,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.29,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sndBlockBtnNotActive({String title}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF0382E4)),
          borderRadius: BorderRadius.circular(28.5),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28.5),
            onTap: () {
              setState(() {
                currentSet = currentSet == ServiceSet.handyman
                    ? ServiceSet.clearing
                    : ServiceSet.handyman;
              });
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.11,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.29,
                    color: Color(0xFF252525),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getServiceItem({String title, String src, VoidCallback onTap}) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.09),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              color: Color(0xFFFAFAFA)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFD7EDFF),
                    ),
                    child: SvgPicture.asset(src),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 11.55,
                        letterSpacing: 0.24,
                        color: Color(0xFF252525),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        RippleWidget(onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HandymanServicePage()));
        })
      ],
    );
  }

  get fstBlockBtns {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 29),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customProjectBtn,
          searchBtn,
        ],
      ),
    );
  }

  get pageBody {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 75),
        decoration: BoxDecoration(
          color: Color(0xFFE4E6E5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            fstBlock,
            SizedBox(height: 9),
            sndBlock,
          ],
        ),
      ),
    );
  }

  get categoriesField {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          categoriesFieldTitle,
          categoriesList,
        ],
      ),
    );
  }

  get categoriesList {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: ScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 16, bottom: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCategoryItem(
              src: 'assets/images/category2.png',
              title: 'Appliances Service and Installation',
            ),
            getCategoryItem(
              src: 'assets/images/category1.png',
              title: 'Fences and Gates',
            ),
            getCategoryItem(
              src: 'assets/images/category3.png',
              title: 'Tree Service',
            ),
          ],
        ),
      ),
    );
  }

  Widget getCategoryItem({String src, String title, VoidCallback onTap}) {
    double size = MediaQuery.of(context).size.width / 2.5;
    return Container(
      margin: EdgeInsets.only(left: 8, top: 7),
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      width: size,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      image: AssetImage(src), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: 46,
                ),
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF252525),
                    ),
                  ),
                ),
              )
            ],
          ),
          RippleWidget(onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProjectCreationPage(title: title)));
          })
        ],
      ),
    );
  }

  get categoriesFieldTitle {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular categories",
            style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF252525),
                letterSpacing: -0.24),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "see all",
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF252525),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  get flatRateFieldTitle {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8, top: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Flat rate services",
            style: GoogleFonts.comfortaa(
                fontSize: 20.85,
                fontWeight: FontWeight.w900,
                color: Color(0xFF252525),
                letterSpacing: 0.34),
          ),
        ],
      ),
    );
  }

  get pageTitle {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "YouHire.net",
            style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                letterSpacing: 0.37,
                color: Colors.white),
          ),
          Text(
            AccountData().accountType == AccountType.personal
                ? "personal"
                : "business",
            style: GoogleFonts.montserrat(
                fontSize: 13, letterSpacing: 0.37, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
