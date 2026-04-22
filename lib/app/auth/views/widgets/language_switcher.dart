import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/language-icon.svg',
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 8),
          const Text(
            'English',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
