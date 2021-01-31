import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageTextField extends StatefulWidget {
  final TextEditingController controller;

  const MessageTextField({Key key, this.controller}) : super(key: key);

  @override
  _MessageTextFieldState createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF4F4F4),
                hintText: "Message",
                hintStyle: GoogleFonts.montserrat(color: Color(0xFFB6B7B8)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 52),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(37),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(37),
                )),
            style:
                GoogleFonts.montserrat(color: Color(0xFF252525), fontSize: 16),
            onChanged: (value) {},
          ),
          Positioned.fill(
            left: 8,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Transform.rotate(
                angle: 3.16 / 4,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.attach_file,
                        color: Color(0xFF252525),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: 8,
            child: Align(
              alignment: Alignment.centerRight,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.send,
                      color: Color(0xFF252525),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
