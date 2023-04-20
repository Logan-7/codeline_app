import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class CommonSnackBar {
  static getSuccessSnackBar(
      BuildContext context, double width, Color color, String message) {
    AnimatedSnackBar.rectangle(
      'Successfully',
      '$message',
      duration: Duration(seconds: 2),
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
      type: AnimatedSnackBarType.success,
      brightness: Brightness.dark,
    ).show(
      context,
    );
  }

  static getFailedSnackBar(
      BuildContext context, double width, Color color, String message) {
    AnimatedSnackBar.rectangle(
      'Failed',
      '$message',
      duration: Duration(seconds: 2),
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
      type: AnimatedSnackBarType.error,
      brightness: Brightness.dark,
    ).show(
      context,
    );
  }

  static getWarningSnackBar(BuildContext context, String message) {
    AnimatedSnackBar.rectangle(
      'warning',
      '$message',
      duration: Duration(seconds: 2),
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
      type: AnimatedSnackBarType.warning,
      brightness: Brightness.dark,
    ).show(
      context,
    );
  }
}
