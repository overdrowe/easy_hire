import 'dart:html';
import 'package:flutter/foundation.dart';

class User {
  final String email;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String district;
  final ImageData profilePhoto;

  final String password;

  const User({
    @required this.email,
    @required this.phoneNumber,
    @required this.firstName,
    @required this.lastName,
    @required this.district,
    @required this.profilePhoto,

    @required this.password,
  }): assert(email != null),
      assert(phoneNumber != null),
      assert(firstName != null),
      assert(lastName != null),
      assert(district != null),
      assert(profilePhoto != null);
}