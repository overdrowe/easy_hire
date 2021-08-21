import 'package:easy_hire/services/account_data.dart';
import 'package:easy_hire/widgets/address_panel.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/custom_radio.dart';
import 'package:easy_hire/widgets/custom_text_field.dart';
import 'package:easy_hire/widgets/huge_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main_pages/main_page_business.dart';
import '../main_pages/main_page_personal.dart';
import '../add_files_page/add_files_page.dart';

class ProjectCreationPage extends StatefulWidget {
  final String title;

  const ProjectCreationPage({Key key, this.title = ""}) : super(key: key);

  @override
  _ProjectCreationPageState createState() => _ProjectCreationPageState();
}

class _ProjectCreationPageState extends State<ProjectCreationPage> {
  int _radioValue = 0;
  int _specialistRadioValue = 0;
  String descriptionText = "";
  DateTime selectedDate = DateTime.now();

  AddressPanel _addressPanel = AddressPanel(
    addressName: "Add address",
    onChanged: null,
  );

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        widget.title,
        onTap: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AccountData().accountType == AccountType.personal ? MainPagePersonal() : MainPageBusiness()),
              (Route<dynamic> route) => false);
        },
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              widget.title == "" ? chooseCategoryField : Container(),
              widget.title == "" ? SizedBox(height: 14) : Container(),
              projectTitleTextField,
              SizedBox(height: 4),
              budgetTextField,
              SizedBox(height: 4),
              whenToStartField,
              SizedBox(height: 14),
              locationField,
              SizedBox(height: 14),
              descriptionTextField,
              SizedBox(height: 14),
              specialistRadioGroup,
              SizedBox(height: 40),
              CustomButton(
                title: "Next",
                isActive: true,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddFilesPage()));
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget get chooseCategoryField {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Category",
            style: GoogleFonts.montserrat(
                fontSize: 19, color: Color(0xFF252525), letterSpacing: 0.38, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color(0xFFF4F4F4),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Choose category",
                      style: GoogleFonts.montserrat(fontSize: 16, color: Color(0xFFB6B7B8)),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFB6B7B8))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  get specialistRadioGroup => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Specialist",
                style: GoogleFonts.montserrat(
                    fontSize: 19, color: Color(0xFF252525), letterSpacing: 0.38, fontWeight: FontWeight.bold)),
            SizedBox(height: 14),
            radioRow(
                text: "All",
                value: 0,
                groupValue: _specialistRadioValue,
                onTap: () {
                  setState(() {
                    _specialistRadioValue = 0;
                  });
                }),
            SizedBox(height: 16),
            radioRow(
                text: "Licensed contractor",
                value: 1,
                groupValue: _specialistRadioValue,
                onTap: () {
                  setState(() {
                    _specialistRadioValue = 1;
                  });
                }),
            SizedBox(height: 16),
            radioRow(
                text: "Handyman",
                value: 2,
                groupValue: _specialistRadioValue,
                onTap: () {
                  setState(() {
                    _specialistRadioValue = 2;
                  });
                }),
          ],
        ),
      );

  get descriptionTextField => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Description",
              style: GoogleFonts.montserrat(
                  fontSize: 19, color: Color(0xFF252525), letterSpacing: 0.38, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          HugeTextField(
            hintText: "Add description",
            text: descriptionText,
            onChanged: (value) {
              setState(() {
                descriptionText = value;
              });
            },
          ),
        ],
      );

  get locationField => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Location",
              style: GoogleFonts.montserrat(
                  fontSize: 19, color: Color(0xFF252525), letterSpacing: 0.38, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          _addressPanel
        ],
      );

  get whenToStartField => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("When to start",
              style: GoogleFonts.montserrat(
                  fontSize: 19, color: Color(0xFF252525), letterSpacing: 0.38, fontWeight: FontWeight.bold)),
          SizedBox(height: 14),
          radioRow(
              text: "Now",
              value: 0,
              groupValue: _radioValue,
              onTap: () {
                setState(() {
                  _radioValue = 0;
                });
              }),
          SizedBox(height: 16),
          radioRow(
              text: "Choose a date",
              value: 1,
              groupValue: _radioValue,
              onTap: () {
                setState(() {
                  _radioValue = 1;
                });
              }),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xFFF4F4F4),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6),
                      onTap: _radioValue != 1
                          ? null
                          : () {
                              _selectDate(context);
                            },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          _radioValue != 1 ? "Add date" : "${selectedDate.toLocal()}".split(' ')[0],
                          style: GoogleFonts.montserrat(
                              fontSize: 16, color: _radioValue != 1 ? Color(0xFFB6B7B8) : Color(0xFF252525)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 9),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xFFF4F4F4),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: _radioValue != 1
                        ? null
                        : () {
                            _selectDate(context);
                          },
                    child: Container(
                      padding: EdgeInsets.all(14),
                      child: SvgPicture.asset(
                        'assets/icons/calendar.svg',
                        color: _radioValue != 1 ? Color(0xFFB6B7B8) : Color(0xFF252525),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      );

  get budgetTextField => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Budget",
              style: GoogleFonts.montserrat(
                  fontSize: 19, color: Color(0xFF252525), letterSpacing: 0.38, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          CustomTextField(
            hintText: "Add Budget",
          ),
        ],
      );

  get projectTitleTextField => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Project title",
              style: GoogleFonts.montserrat(
                  fontSize: 19, color: Color(0xFF252525), letterSpacing: 0.38, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          CustomTextField(
            hintText: "Add project",
          ),
        ],
      );

  Widget radioRow({String text, int value, int groupValue, VoidCallback onTap}) {
    return CustomRadio(
      title: text,
      value: value,
      groupValue: groupValue,
      onTap: onTap,
    );
  }
}
