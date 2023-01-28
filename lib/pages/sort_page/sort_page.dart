import 'package:easy_hire/app_style/app_style.dart';
import 'package:easy_hire/widgets/acceptable_app_bar.dart';
import 'package:easy_hire/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SortPage extends StatefulWidget {
  @override
  _SortPageState createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  int _groupValue = 0;
  double sliderValue = 20;
  TextEditingController _controller = new TextEditingController();
  String distanceUnit = "km";

  @override
  void initState() {
    super.initState();
    _controller.text = sliderValue.round().toString();
  }

  get distanceButton {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppStyle().mainColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              if (distanceUnit == "km")
                distanceUnit = "miles";
              else
                distanceUnit = "km";
            });
          },
          child: Container(
              padding: EdgeInsets.all(16),
              child: Text(
                distanceUnit,
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  letterSpacing: -0.24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252525),
                ),
              ),
          ),
        ),
      ),
    );
  }

  get distance {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Distance",
            style: GoogleFonts.montserrat(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF252525),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: _controller,
                  prefix: Text(
                    "Before     ",
                    style: GoogleFonts.montserrat(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF252525),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (double.parse(value) > 300) {
                        sliderValue = 300;
                        _controller.text = "300";
                      } else if (double.parse(value) < 1) {
                        sliderValue = 1;
                        _controller.text = "1";
                      } else {
                        sliderValue = double.parse(value);
                      }
                    });
                  },
                ),
              ),
              SizedBox(width: 8),
              distanceButton,
            ],
          ),
          Slider(
              min: 1,
              max: 300,
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                  _controller.text = value.round().toString();
                });
              })
        ],
      ),
    );
  }

  Widget sortField(
      {int value, int groupValue, String title, VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 17,
              color: Color(0xFF252525),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: onTap,
              child: Icon(
                Icons.sort,
                color:
                value == groupValue ? AppStyle().mainColor : Color(0xFFB6B7B8),
              ),
            ),
          )
        ],
      ),
    );
  }

  get sortByDate {
    return sortField(
      title: "by publication date",
      value: 0,
      groupValue: _groupValue,
      onTap: () {
        setState(() {
          _groupValue = 0;
        });
      },
    );
  }

  get sortByPrice {
    return sortField(
        title: "at the price",
        value: 1,
        groupValue: _groupValue,
        onTap: () {
          setState(() {
            _groupValue = 1;
          });
        });
  }

  get divider {
    return Divider(height: 1, thickness: 0.5, color: Color(0xFFB6B7B8));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AcceptableAppBar(
        "Sort",
        onConfirm: () {},
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            divider,
            sortByDate,
            sortByPrice,
            divider,
            distance,
            divider,
            defaultFilter,
          ],
        ),
      ),
    );
  }

  get defaultFilter {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: TextButton(
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
}
