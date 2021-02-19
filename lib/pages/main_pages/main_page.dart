
import 'package:easy_hire/singleton/account_data.dart';
import 'package:flutter/material.dart';

import 'main_page_business.dart';
import 'main_page_personal.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return AccountData().accountType == AccountType.business ? MainPageBusiness() : MainPagePersonal();
  }
}
