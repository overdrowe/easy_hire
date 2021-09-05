import 'package:easy_hire/models/user/user.dart';
import 'package:flutter/foundation.dart';

class SpecialistUser extends User {
  final String licensePhoto;
  final String insurancePhoto;
  final String specializationCategory;
  final String companyName;
  final String certificatePhoto;
  final bool isReceiveOfferForHandyman;

  const SpecialistUser({
    @required email,
    @required phoneNumber,
    @required firstName,
    @required lastName,
    @required district,
    @required profilePhoto,
    @required password,

    @required this.licensePhoto,
    @required this.insurancePhoto,
    @required this.specializationCategory,
    @required this.companyName,
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