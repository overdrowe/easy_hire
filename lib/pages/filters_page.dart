import 'dart:math';

import 'package:easy_hire/widgets/acceptable_app_bar.dart';
import 'package:easy_hire/widgets/custom_radio.dart';
import 'package:easy_hire/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'categories_page.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  Map categories = new Map();
  int _groupValue = 0;
  TextEditingController leftController = new TextEditingController();
  TextEditingController rightController = new TextEditingController();
  RangeValues _currentRangeValues = const RangeValues(1, 500);

  get defaultFilter {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: FlatButton(
        onPressed: () {},
        child: Text("return the default filter",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              letterSpacing: -0.41,
              fontWeight: FontWeight.w500,
              color: Color(0xFFE14949),
            )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    leftController.text = "0";
    rightController.text = "500";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AcceptableAppBar(
        "Filters",
        onConfirm: () {},
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(height: 1, thickness: 0.5, color: Color(0xFFB6B7B8)),
              categoriesField,
              divider,
              specialistField,
              divider,
              SizedBox(height: 12),
              costField,
              divider,
              defaultFilter,
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> selectedCategories() {
    List<Widget> widgetsList = new List<Widget>();
    categories.forEach((key, value) {
      if (value) {
        widgetsList.add(Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(37),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(key.toString().toLowerCase(),
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    color: Color(0xFF252525),
                  )),
              SizedBox(width: 8),
              Transform.rotate(
                angle: pi / 4,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      categories[key] = false;
                    });
                  },
                  child: Icon(
                    Icons.add_circle_sharp,
                    color: Color(0xFF252525).withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        ));
      }
    });
    return widgetsList;
  }

  get categoriesField {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () async {
          categories = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CategoriesPage()));
          setState(() {
            print(categories);
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        letterSpacing: 0.38,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF252525),
                      )),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF252525),
                  ),
                ],
              ),
              categories != null ? categories.containsValue(true)
                  ? Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Wrap(
                        runSpacing: 8,
                        spacing: 8,
                        children: selectedCategories(),
                      ))
                  : Container() : Container(),
            ],
          ),
        ),
      ),
    );
  }

  get divider {
    return Divider(
      height: 0,
      thickness: 0.5,
      color: Color(0xFFB6B7B8),
    );
  }

  get specialistField {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Specialist",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                letterSpacing: 0.38,
                fontWeight: FontWeight.bold,
                color: Color(0xFF252525),
              )),
          SizedBox(height: 12),
          CustomRadio(
            title: "all",
            value: 0,
            groupValue: _groupValue,
            onTap: () {
              setState(() {
                _groupValue = 0;
              });
            },
          ),
          SizedBox(height: 12),
          CustomRadio(
            title: "licensed",
            value: 1,
            groupValue: _groupValue,
            onTap: () {
              setState(() {
                _groupValue = 1;
              });
            },
          ),
          SizedBox(height: 12),
          CustomRadio(
            title: "handyman",
            value: 2,
            groupValue: _groupValue,
            onTap: () {
              setState(() {
                _groupValue = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  get costField {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Cost",
              style: GoogleFonts.montserrat(
                fontSize: 20,
                letterSpacing: 0.38,
                fontWeight: FontWeight.bold,
                color: Color(0xFF252525),
              )),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: leftController,
                  prefix: Text(
                    r"$",
                    style: GoogleFonts.montserrat(
                        color: Color(0xFF252525), fontSize: 16),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: CustomTextField(
                  controller: rightController,
                  prefix: Text(
                    r"$",
                    style: GoogleFonts.montserrat(
                        color: Color(0xFF252525), fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          RangeSlider(
              divisions: 500,
              values: _currentRangeValues,
              min: 0,
              max: 500,
              onChanged: (values) {
                setState(() {
                  _currentRangeValues = values;
                  leftController.text =
                      (_currentRangeValues.start.round()).toString();
                  rightController.text =
                      (_currentRangeValues.end.round()).toString();
                });
              }),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
