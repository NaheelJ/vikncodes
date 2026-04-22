import 'package:flutter/material.dart';
import 'package:vikncodes/app.dart';
import 'package:vikncodes/core/widget/event_snackbar.dart';
import '../routes/app_router.dart';

class SnackbarUtil {
  /// Show a message as a snackbar
  ///
  /// Shows an error [message] as a snackbar to the user with red background color
  static void showError(String message) {
    MyApp.scaffoldMessengerKey.currentState?.showSnackBar(
      EventSnackBar(errorMessage: message, bgColor: Colors.redAccent[700]!),
    );
  }

  /// Show a success [message] as a snackbar to the user with green background color
  static void showSuccess(String message) {
    MyApp.scaffoldMessengerKey.currentState?.showSnackBar(
      EventSnackBar(errorMessage: message, bgColor: Colors.green[800]!),
    );
  }

  /// Show an info [message] as a snackbar to the user with blue background color
  static void showInfo(String message) {
    MyApp.scaffoldMessengerKey.currentState?.showSnackBar(
      EventSnackBar(errorMessage: message, bgColor: Colors.blue[800]!),
    );
  }

  //no context hover snack bar
  static OverlayEntry? _overlayEntry;

  static void showHover(
    String message, {
    Duration duration = const Duration(seconds: 3),
    Color? color,
    Color? textColor,
  }) {
    if (_overlayEntry != null) return; // Prevent multiple snackbars

    final overlay = AppRouter.navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        final viewInsets = MediaQuery.of(context).viewInsets.bottom;
        final bottomPadding = viewInsets > 0 ? viewInsets + 20 : 50.0;

        return Positioned(
          left: 20,
          right: 20,
          bottom: bottomPadding,
          child: _HoverSnackbarWidget(
            message: message,
            color: color,
            textColor: textColor,
          ),
        );
      },
    );

    overlay.insert(_overlayEntry!);

    Future.delayed(duration, () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }
}

class _HoverSnackbarWidget extends StatelessWidget {
  final String message;
  final Color? color;
  final Color? textColor;

  const _HoverSnackbarWidget({
    required this.message,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color ?? Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message,
          style: TextStyle(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
