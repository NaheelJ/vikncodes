import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/colors.dart';
import '../../controllers/auth_provider.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return Container(
          width: 358,
          decoration: BoxDecoration(
            color: AppColors.containerBackground,
            borderRadius: BorderRadius.circular(11),
            border: Border.all(color: AppColors.containerBorder, width: 1),
          ),
          child: Column(
            children: [
              // Username Field
              TextFormField(
                controller: auth.usernameController,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: const InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.person_outline, color: Colors.blue),
                  ),
                  labelText: 'Username',
                  labelStyle: TextStyle(color: AppColors.labelGrey, fontSize: 14),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  return null;
                },
              ),
              const Divider(color: AppColors.containerBorder, height: 1),
              // Password Field
              TextFormField(
                controller: auth.passwordController,
                obscureText: !auth.isPasswordVisible,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.vpn_key_outlined, color: Colors.blue),
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: AppColors.labelGrey, fontSize: 14),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: IconButton(
                    icon: Icon(
                      auth.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.blue,
                      size: 20,
                    ),
                    onPressed: () => auth.togglePasswordVisibility(),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  if (value.length < 6) {
                    return 'Min 6 chars';
                  }
                  return null;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
