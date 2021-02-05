import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F4F4),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: title,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          customBtnStyle(
            title: "How it works?",
            icon: SvgPicture.asset('assets/icons/youtube.svg', color: Color(0xFF252525)),
            onTap: () {},
          ),
          customBtnStyle(
            title: "Live chat support",
            icon: SvgPicture.asset('assets/icons/chat.svg', color: Color(0xFF252525)),
            onTap: () {},
          ),
          customBtnStyle(
            title: "News",
            icon: SvgPicture.asset('assets/icons/news.svg', color: Color(0xFF252525)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget customBtnStyle({String title, Widget icon, VoidCallback onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    color: Color(0xFF252525),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.41,
                  ),
                ),
                icon
              ],
            ),
          ),
        ),
      ),
    );
  }

  get title {
    return Text(
      'Help',
      style: GoogleFonts.montserrat(
        fontSize: 22,
        color: Color(0xFF252525),
        fontWeight: FontWeight.bold,
        letterSpacing: 0.37,
      ),
    );
  }
}
