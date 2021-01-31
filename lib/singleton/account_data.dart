import 'package:easy_hire/models/project.dart';

class AccountData {
  static final AccountData _singleton = new AccountData._internal();
  AccountType accountType = AccountType.business;

  factory AccountData() {
    return _singleton;
  }

  AccountData._internal();

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
    Project(
      title: "Paint the walls",
    ),
  ];
}

enum AccountType {personal, business}
