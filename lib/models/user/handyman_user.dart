import 'package:easy_hire/models/user/user.dart';
import 'package:flutter/foundation.dart';

class HandymanUser extends User {
  final String insurancePhoto;
  final String certificatePhoto;
  final bool isReceiveOfferForHandyman;

  const HandymanUser({
    @required email,
    @required phoneNumber,
    @required firstName,
    @required lastName,
    @required district,
    @required profilePhoto,
    @required password,

    @required this.insurancePhoto,
    @required this.certificatePhoto,
    @required this.isReceiveOfferForHandyman,
  }): super(
    email: email,
    phoneNumber: phoneNumber,
    firstName: firstName,
    lastName: lastName,
    district: district,
    profilePhoto: profilePhoto,
    password: password,
  );
}