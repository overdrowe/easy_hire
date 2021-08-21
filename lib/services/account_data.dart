

import 'dart:io';

import 'package:easy_hire/models/msg_dialog.dart';
import 'package:easy_hire/models/project.dart';
import 'package:easy_hire/models/review.dart';

class AccountData {
  static final AccountData _singleton = new AccountData._internal();
  AccountType accountType = AccountType.personal;
  File avatarImageFile;

  factory AccountData() {
    return _singleton;
  }

  bool notificationTune = true;

  AccountData._internal();

  List<MsgDialog> dialogsList = [
    MsgDialog(
      name: "Jack Milton",
      lastMsg:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis.",
    ),
    MsgDialog(
      name: "Floyd Miles",
      newMsgCount: 10,
      lastMsg:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis.",
    )
  ];

  List<Project> projectsList = [
    Project(
      title: "Paste wallpaper",
      price: 70,
      address: "2715 Ash Dr. San Jose, South Dakota 83475",
      date: DateTime.parse("2015-05-27"),
      description:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. "
          "Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
    ),
    Project(
        title: "Paint the walls",
        price: 50,
        address: "4517 Washington Ave. Manchester, Kentucky... ",
        date: DateTime.parse("2012-01-15"),
        description:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. "
            "Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet."),
  ];

  List<Review> reviewsList = [
    Review(
      "Jack Milton",
      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      ReviewValue.like,
      DateTime.parse("2015-05-27"),
    ),
    Review(
      "Floyd Miles",
      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      ReviewValue.like,
      DateTime.parse("2015-05-27"),
    ),
  ];
}


enum AccountType { personal, business }
