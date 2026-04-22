import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:vikncodes/app/auth/views/pages/login_page.dart';
import 'package:vikncodes/app/bottom_navigation/views/pages/bottom_navigation_bar.dart';
import 'package:vikncodes/app/auth/controllers/auth_provider.dart';
import 'package:vikncodes/core/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "/splash";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 1500),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();
    _checkAuth();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    
    if (!mounted) return;

    final authProvider = context.read<AuthProvider>();
    await authProvider.checkAuth();
    
    if (!mounted) return;

    // Navigation logic
    if (authProvider.isAuthenticated) {
      context.go(AppBottomNavigationBar.routeName);
    } else {
      context.go(LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Image.asset(
              'assets/images/App_banner_logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}