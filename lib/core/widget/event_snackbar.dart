import 'package:flutter/material.dart';

class EventSnackBar extends SnackBar {
  /// A custom SnackBar widget to display event messages.
  final String errorMessage;
  final Color bgColor;
  final Color textColor;

  EventSnackBar({
    super.key,
    required this.errorMessage,
    required this.bgColor,
    this.textColor = Colors.white,
  }) : super(
         content: Text(errorMessage, style: TextStyle(color: textColor)),
         behavior: SnackBarBehavior.floating,
         margin: EdgeInsets.all(16),
         backgroundColor: bgColor,
       );
}
