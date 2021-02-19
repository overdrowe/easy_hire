import 'package:easy_hire/app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButtonsBlock extends StatefulWidget {
  final Color secondColor;

  const ActionButtonsBlock({Key key, this.secondColor = Colors.white})
      : super(key: key);

  @override
  _ActionButtonsBlockState createState() => _ActionButtonsBlockState();
}

class _ActionButtonsBlockState extends State<ActionButtonsBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          btnItem(title: "hire", color: AppStyle().mainColor, onTap: () {}),
          btnItem(title: "deny", color: widget.secondColor, onTap: () {}),
          // btnItem(title: "block", color: widget.secondColor, onTap:),
          myPopMenu
        ],
      ),
    );
  }

  btnItem({String title, VoidCallback onTap, Color color}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  color: color == AppStyle().mainColor
                      ? Colors.white
                      : Color(0xFF252525),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  get myPopMenu {
    return PopupMenuButton(
        onSelected: (value) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content:
                value == 1 ? Text("The user is blocked") : Text("Report sent"),
          ));
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.block),
                      ),
                      Text('Block')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.report_gmailerrorred_outlined),
                      ),
                      Text('Report user')
                    ],
                  )),
            ]);
  }
}
