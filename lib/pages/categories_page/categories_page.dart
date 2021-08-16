import 'package:easy_hire/models/category_item.dart';
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

  CategoryItem windows = CategoryItem(title: "Windows, Doors, Window Coverings", categoryLvl: 1, children: [
    CategoryItem(
      title: "Window",
      categoryLvl: 2,
      children: [
        CategoryItem(title: "Install a New Windows", categoryLvl: 3),
        CategoryItem(title: "Hire a Window Installer", categoryLvl: 3),
        CategoryItem(title: "Repair a Window", categoryLvl: 3),
        CategoryItem(title: "Egress Windows - New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Storm Windows – New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Window Screens –New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Window Security Bars - NewInstall, Alter, Repair", categoryLvl: 3),
        CategoryItem(title: "Exterior Window Shutters - New Install, Repair, Repair", categoryLvl: 3),
        CategoryItem(title: "Interior Window Shutters – New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Window Tinting – Apply, Replace", categoryLvl: 3),
        CategoryItem(title: "Window Hardware, Latches or Tracks – Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Window Weatherstripping – New Install, Replace", categoryLvl: 3),
        CategoryItem(title: "Window Well Covers – New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Window Glass Repair", categoryLvl: 3),
      ],
    ),
    CategoryItem(
      title: "Doors",
      categoryLvl: 2,
      children: [
        CategoryItem(title: "Install a New Door", categoryLvl: 3),
        CategoryItem(title: "Hire a Door Installer", categoryLvl: 3),
        CategoryItem(title: "Door Screens – New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Sliding Door - New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Door Weatherstripping – New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Door Hardware, Latches or Tracks - Repair or Replace", categoryLvl: 3),
        CategoryItem(title: "Exterior Door - New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Interior Door - New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Door Security Bars - New Install, Alter, Repair", categoryLvl: 3),
        CategoryItem(title: "Storm Doors – New Install, Repair, Replace", categoryLvl: 3),
      ],
    ),
    CategoryItem(
      title: "Windows Coverings",
      categoryLvl: 2,
      children: [
        CategoryItem(title: "1.	Automatic Drape, Shade or Blind Opener -New Install, Repair, Replace", categoryLvl: 3),
      ],
    ),
    CategoryItem(
      title: "Blinds",
      categoryLvl: 2,
      children: [
        CategoryItem(title: "Vertical Blinds - New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Blinds - New Install, Repair, Replace", categoryLvl: 3),

      ],
    ),
    CategoryItem(
      title: "Shades",
      categoryLvl: 2,
      children: [
        CategoryItem(title: "Shades - New Install, Repair, Replace", categoryLvl: 3),
      ],
    ),
    CategoryItem(
      title: "Shutters",
      categoryLvl: 2,
      children: [
        CategoryItem(title: "Exterior Shutters - New Install, Repair, Restore", categoryLvl: 3),
        CategoryItem(title: "Interior Shutters - New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Indoor Shutters - New Install, Repair, Replace", categoryLvl: 3),
        CategoryItem(title: "Security or Storm Shutters - New Install or Repair, Replace", categoryLvl: 3),
      ],
    ),
    CategoryItem(
      title: "Drapes or Curtains",
      categoryLvl: 2,
      children: [
        CategoryItem(title: "Drapes or Curtains - Custom Sew or Alter", categoryLvl: 3),
        CategoryItem(title: "Drapes or Curtains – New Install, Repair, Replace", categoryLvl: 3),
      ],
    )
  ]);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
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
                SizedBox(
                  height: 16,
                ),
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
              onPressed: () {
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
