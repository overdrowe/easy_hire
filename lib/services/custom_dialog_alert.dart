import 'package:flutter/material.dart';

class CustomDialogAlert {

  static final CustomDialogAlert _customDialogAlert = CustomDialogAlert._internal();

  factory CustomDialogAlert() {
    return _customDialogAlert;
  }

  CustomDialogAlert._internal();

  Future<void> showAlert({
    @required BuildContext context,
    @required String title,
    @required String message,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}