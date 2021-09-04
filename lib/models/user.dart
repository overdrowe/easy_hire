import 'dart:html';

import 'package:flutter/foundation.dart';

class User {

  final String name;
  final String lastName;
  final int age;
  final String sex;

  final String phone;
  final String login;
  final String password;

  final ImageData avatar;

  User({
    @required this.name,
    @required this.lastName,
    @required this.age,
    @required this.sex,
    @required this.phone,
    @required this.login,
    @required this.password,
    @required this.avatar,
  });
}