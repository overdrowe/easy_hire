import 'package:easy_hire/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatefulWidget {
  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            Expanded(child: SearchTextField()),
            Container(
                padding: EdgeInsets.all(13),
                margin: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(6)),
                child: Icon(
                  Icons.zoom_out_rounded,
                  color: Color(0xFFB6B7B8),
                ))
          ],
        ),
        backgroundColor: Color(0xFFF4F4F4),
        centerTitle: true,
      ),
    );
  }
}
