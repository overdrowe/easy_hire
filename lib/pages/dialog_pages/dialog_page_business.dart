import 'package:easy_hire/models/msg_dialog.dart';
import 'package:easy_hire/pages/user_pages/user_page_personal.dart';
import 'package:easy_hire/singleton/account_data.dart';
import 'package:easy_hire/widgets/message_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogPageBusiness extends StatefulWidget {
  final MsgDialog dialogInfo;

  const DialogPageBusiness({Key key, this.dialogInfo}) : super(key: key);

  @override
  _DialogPageBusinessState createState() => _DialogPageBusinessState();
}

class _DialogPageBusinessState extends State<DialogPageBusiness> {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: IconThemeData(color: Color(0xFF252525)),
        actions: [moreBtn],
        automaticallyImplyLeading: false,
        title: title,
        elevation: 0,
        backgroundColor: Color(0xFFF4F4F4),
        bottom: header,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                    child: MessageTextField(
                  controller: _controller,
                )),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFF4F4F4),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: CircleBorder(),
                      child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Icon(
                            Icons.mic_rounded,
                            color: Color(0xFF252525),
                          )),
                      onTap: () {},
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  get header {
    return PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 75),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AccountData().projectsList[0].getProjectItem(automaticallyImplyDivider: false),
        ));
  }

  get avatar {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/image1.jpg'),
        ),
      ),
    );
  }

  get accountName {
    return Row(
      children: [
        Text(
          "Brooklyn Simmons",
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF252525),
          ),
        ),
        SizedBox(width: 8),
        Icon(
          Icons.arrow_forward_ios,
          size: 12,
        )
      ],
    );
  }

  get status {
    return Text(
      "Online",
      style: GoogleFonts.montserrat(
        fontSize: 8,
        color: Color(0xFF252525).withOpacity(0.6),
      ),
    );
  }

  get backArrow {
    return InkWell(
      borderRadius: BorderRadius.circular(37),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Icon(Icons.arrow_back),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  get title {
    return Row(
      children: [
        backArrow,
        InkWell(
          borderRadius: BorderRadius.circular(37),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserPagePersonal()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                avatar,
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [accountName, status],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  get moreBtn {
    return InkWell(
      borderRadius: BorderRadius.circular(37),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Icon(Icons.more_horiz),
      ),
      onTap: () {},
    );
  }
}
