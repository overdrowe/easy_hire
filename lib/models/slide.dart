import 'package:easy_hire/app_localization/app_localization.dart';
import 'package:flutter/material.dart';

class Slide {
  final String title;
  final String description;

  Slide({
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  // Slide(
  //   title: 'YouHire',
  //   description: AppLocalizations.of(context).translate('first_string'),
  // ),
  Slide(
    title: 'YouHire',
    description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
  ),
  Slide(
    title: 'YouHire',
    description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
  ),
  Slide(
    title: 'YouHire',
    description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
  ),
];
