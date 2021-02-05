import 'dart:ui';

import 'package:easy_hire/singleton/account_data.dart';
import 'package:easy_hire/widgets/ripple_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0070C2),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
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
            onTap: () {},
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
      margin: EdgeInsets.only(left: 16),
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
          onTap: () {},
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
      margin: EdgeInsets.only(left: 8, right: 8, top: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Column(
        children: [
          flatRateFieldTitle,
          sndBlockBtns,
          flatRateServicesField,
        ],
      ),
    );
  }

  get flatRateServicesField {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Wrap(
        runSpacing: 16,
        spacing: 16,
        children: [
          getServiceItem(
            title: 'Appliances Service and Installation',
            src: 'assets/icons/washer.svg',
            onTap: () {},
          ),
          getServiceItem(
            title: 'Appliances Service and Installation',
            src: 'assets/icons/fence.svg',
            onTap: () {},
          ),
          getServiceItem(
            title: 'Appliances Service and Installation',
            src: 'assets/icons/washer.svg',
            onTap: () {},
          ),
          getServiceItem(
            title: 'Appliances Service and Installation',
            src: 'assets/icons/fence.svg',
            onTap: () {},
          ),
          getServiceItem(
            title: 'Appliances Service and Installation',
            src: 'assets/icons/fence.svg',
            onTap: () {},
          ),
          getServiceItem(
            title: 'Appliances Service and Installation',
            src: 'assets/icons/washer.svg',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  get sndBlockBtns {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sndBlockBtnActive(title: "Handyman Services"),
          SizedBox(width: 16),
          sndBlockBtnNotActive(title: "Clearing Services"),
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
              height: 60,
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
                padding: EdgeInsets.symmetric(vertical: 16),
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
            onTap: () {},
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
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
    double size = MediaQuery.of(context).size.width / 2.5;
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(minHeight: 140),
          width: size,
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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFD7EDFF),
                ),
                child: SvgPicture.asset(src),
              ),
              Padding(
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
              )
            ],
          ),
        ),
        RippleWidget(onTap: onTap)
      ],
    );
  }

  get fstBlockBtns {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCategoryItem(
            src: 'assets/images/category2.png',
            title: 'Appliances Service and Installation',
            onTap: () {},
          ),
          getCategoryItem(
            src: 'assets/images/category1.png',
            title: 'Fences and Gates',
            onTap: () {},
          ),
          getCategoryItem(
            src: 'assets/images/category3.png',
            title: 'Tree Service',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget getCategoryItem({String src, String title, VoidCallback onTap}) {
    double size = MediaQuery.of(context).size.width / 2.5;
    return Container(
      margin: EdgeInsets.only(left: 16, top: 16, bottom: 44),
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
          RippleWidget(onTap: onTap)
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
      padding: const EdgeInsets.only(left: 16, right: 8, top: 32),
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
            AccountData().accountType == AccountType.personal ? "personal" : "business",
            style: GoogleFonts.montserrat(
                fontSize: 13, letterSpacing: 0.37, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2 - 20, size.height-13);
    path.quadraticBezierTo(
        size.width / 2 - 8, size.height - 13, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width / 2 + 8, size.height - 13, size.width / 2 + 20, size.height-13);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
