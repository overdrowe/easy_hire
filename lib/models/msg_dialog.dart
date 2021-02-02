import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MsgDialog {
  final String name;
  final String lastMsg;
  final File avatarSrc;
  final int newMsgCount;

  MsgDialog({this.newMsgCount = 0, this.name, this.lastMsg, this.avatarSrc});

  Widget getDialogItem({VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              avatar,
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [accountName, status],
                ),
              ),
              SizedBox(width: 16),
              newMsgCount > 0
                  ? Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                          color: Color(0xFF42B39B),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        newMsgCount.toString(),
                        style: GoogleFonts.montserrat(fontSize: 10, color: Color(0xFF252525)),
                      ),
                    )
                  : SizedBox(width: 24),
            ],
          ),
        ),
      ),
    );
  }

  get accountName {
    return Text(
      name,
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF252525)),
    );
  }

  get status {
    return Text(
      lastMsg,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(fontSize: 12, color: Color(0xFFB6B7B8)),
    );
  }

  get avatar {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/image1.jpg'),
        ),
      ),
    );
  }
}
