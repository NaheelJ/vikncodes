import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an Account? ",
          style: TextStyle(color: Colors.white, letterSpacing: 1),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "Sign up now!",
            style: TextStyle(
              color: AppColors.secondaryBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
