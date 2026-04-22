import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Login to your vikn account',
          style: TextStyle(
            color: AppColors.textGrey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
