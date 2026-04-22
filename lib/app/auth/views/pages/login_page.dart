import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:vikncodes/app/bottom_navigation/views/pages/bottom_navigation_bar.dart';
import 'package:vikncodes/core/utils/snack_bar_util.dart';
import '../../../../core/constants/colors.dart';
import '../../controllers/auth_provider.dart';
import '../../../../core/utils/app_loader.dart';

import 'package:vikncodes/app/auth/views/widgets/language_switcher.dart';
import 'package:vikncodes/app/auth/views/widgets/login_footer.dart';
import 'package:vikncodes/app/auth/views/widgets/login_form_fields.dart';
import 'package:vikncodes/app/auth/views/widgets/login_header.dart';
import 'package:vikncodes/app/auth/views/widgets/sign_in_button.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/login";
  const LoginPage({super.key});

  void _handleLogin(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    if (authProvider.formKey.currentState!.validate()) {
      // Show Loader
      AppLoader.show(context);
      
      final success = await authProvider.login(
        authProvider.usernameController.text,
        authProvider.passwordController.text,
      );

      // Hide Loader
      if (context.mounted) AppLoader.hide(context);

      if (success) {
        if (context.mounted) {
          // Show Success Dialog
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppColors.containerBackground,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              title: const Column(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 60),
                  SizedBox(height: 16),
                  Text('Success', style: TextStyle(color: Colors.white)),
                ],
              ),
              content: const Text(
                'Login successfully',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textGrey),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK', style: TextStyle(color: AppColors.primaryBlue)),
                ),
              ],
            ),
          );
          
          if (context.mounted) {
            context.go(AppBottomNavigationBar.routeName);
          }
        }
      } else {
        if (context.mounted) {
          log('error ${authProvider.errorMessage}');
          SnackbarUtil.showError(authProvider.errorMessage ?? 'Login failed');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Consumer<AuthProvider>(
            builder: (context, auth, child) {
              return Form(
                key: auth.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const LanguageSwitcher(),
                    const SizedBox(height: 100),
                    const LoginHeader(),
                    const SizedBox(height: 40),
                    const LoginFormFields(),
                    const SizedBox(height: 20),
                    // Forgotten Password
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgotten Password?',
                        style: TextStyle(color: AppColors.secondaryBlue),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SignInButton(onPressed: () => _handleLogin(context)),
                    const SizedBox(height: 60),
                    const LoginFooter(),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}