import 'package:easy_hire/widgets/circular_check_box.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  Map categories = {
    "Windows": false,
    "Doors": false,
    "Windows Coverings": false,
    "Walls & Ceilings (Indoor)": false,
    "Siding": false,
    "Interior Painting or Staining": false,
    "Exterior Painting or Staining": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Color(0xFF252525),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xFF252525),
            ),
            onPressed: () {},
          )
        ],
        elevation: 0,
        title: Text(
          "Categories",
          style: GoogleFonts.montserrat(
            fontSize: 22,
            letterSpacing: 0.38,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252525),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFB6B7B8),
      body: Container(
        margin: EdgeInsets.only(top: 0.5),
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Windows, Doors, Window Coverings",
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    letterSpacing: 0.38,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF252525),
                  ),
                ),
                customCheckBox("Windows", false),
                customCheckBox("Doors", false),
                customCheckBox("Windows Coverings", false),
                divider,
                customCheckBox("Walls & Ceilings (Indoor)", true),
                divider,
                customCheckBox("Siding", true),
                divider,
                SizedBox(height: 16,),
                Text(
                  "Painting & Staining",
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    letterSpacing: 0.38,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF252525),
                  ),
                ),
                customCheckBox("Interior Painting or Staining", false),
                customCheckBox("Exterior Painting or Staining", false),
                divider,
              ],
            ),
            CustomButton(
              title: "Save",
              isActive: true,
              onPressed: (){
                Navigator.of(context).pop(categories);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget customCheckBox(String title, bool boldTitle) {
    return CircularCheckBox(
      boldTitle: boldTitle,
      title: title,
      isActive: categories[title],
      onTap: () {
        setState(() {
          categories[title] = !categories[title];
        });
      },
    );
  }

  get divider {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Divider(
        height: 0,
        thickness: 0.5,
        color: Color(0xFFB6B7B8),
      ),
    );
  }
}
