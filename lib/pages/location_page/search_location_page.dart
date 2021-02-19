import 'dart:math';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_place/google_place.dart';

class SearchLocationPage extends StatefulWidget {
  @override
  _SearchLocationPageState createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  AutocompleteResponse result;
  TextEditingController _controller;

  @required
  initState() {
    super.initState();
    _controller = new TextEditingController();
  }

  Widget get suggestedLocationOptions {
    List<Widget> widgetsList = new List<Widget>();
    result.predictions.forEach((element) {
      widgetsList.add(
        element.description != _controller.text ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            customDivider,
            locationHistoryItem(text: element.description),
          ],
        ) : Container(),
      );
    });
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFFF4F4F4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: widgetsList,
      ),
    );
  }

  Widget locationHistoryItem({@required String text}) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 13,
            color: Color(0xFF252525),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _controller.text = text;
          getPlacesByQuery(text);
        });
      },
    );
  }

  Widget get customDivider {
    return Divider(
      color: Color(0xFFB6B7B8),
      height: 2,
      thickness: 0.3,
    );
  }

  Future<void> getPlacesByQuery(String query) async {
    var googlePlace = GooglePlace("AIzaSyDVutR9u2vx58qSsfCSUc6WFdj8fost4p4");
    String textQuery = query.trim();
    print(textQuery);
    try {
      googlePlace.autocomplete.get(textQuery).then((value) {
        setState(() {
          result = value;
        });
      });
      // print(result.predictions[0].description);
    } catch (Exception) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar("location"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Color(0xFFF4F4F4)),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Center(
                        child: Column(
                          children: [
                            TextField(
                              controller: _controller,
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: Color(0xFF252525),
                              ),
                              autofocus: true,
                              decoration: InputDecoration(
                                suffixIcon: Transform.rotate(
                                  angle: pi / 4,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: IconButton(
                                      splashRadius: 23,
                                      icon: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Icon(
                                          Icons.add_circle_sharp,
                                          color: Color(0xFF252525).withOpacity(0.65),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _controller.clear();
                                          result = null;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: Color(0xFFB6B7B8),
                                ),
                                hintText: "Enter address",
                              ),
                              onChanged: (value) {
                                setState(() {
                                  getPlacesByQuery(value);
                                });
                              },
                            ),
                            result != null ? suggestedLocationOptions : Container()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: CustomButton(
              title: "Next",
              isActive: false,
              onPressed: () {
                // Navigator.of(context).pop(result != null ? result.predictions[0]);
              },
            ),
          )
        ],
      ),
    );
  }
}
