import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MsgDialog {
  final String name;
  final String lastMsg;
  final File avatar;

  MsgDialog({this.name, this.lastMsg, this.avatar});

  Widget getDialogItem({VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(child: FlutterLogo(), backgroundColor: Color(0xFFF4F4F4),),
          title: Text(
            name,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xFF252525)),
          ),
          subtitle: Text(
            lastMsg,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(fontSize: 12, color: Color(0xFFB6B7B8)),
          ),
        ),
      ),
    );
  }
}
