import 'package:easy_hire/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchTextField(
              onTap: () {
              },
            )
          ],
        ),
        backgroundColor: Color(0xFFF4F4F4),
        centerTitle: true,
      ),
    );
  }

  get pageTitle {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: EdgeInsets.all(16),
            child: Text(
              "Projects",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.38,
                  fontSize: 19,
                  color: Color(0xFF252525)),
            )),
        Divider(
          height: 1,
          thickness: 0.5,
          color: Color(0xFFB6B7B8),
        )
      ],
    );
  }

}
