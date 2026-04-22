import 'package:flutter/material.dart';
import 'package:vikncodes/app/profile/views/widgets/logout_button.dart';
import 'package:vikncodes/app/profile/views/widgets/profile_header.dart';
import 'package:vikncodes/app/profile/views/widgets/profile_option_item.dart';
import 'package:vikncodes/app/profile/views/widgets/profile_stats.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            children: [
              // Main Profile Card
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF0F0F0F),
                  borderRadius: BorderRadius.circular(44),
                ),
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                child: const Column(
                  children: [
                    ProfileHeader(),
                    SizedBox(height: 20),
                    ProfileStats(),
                    SizedBox(height: 21),
                    LogoutButton(),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              ProfileOptionItem(
                iconPath: 'assets/icons/help-icon.svg',
                title: 'Help',
                onTap: () {},
              ),
              ProfileOptionItem(
                iconPath: 'assets/icons/faq-icon.svg',
                title: 'FAQ',
                onTap: () {},
              ),
              ProfileOptionItem(
                iconPath: 'assets/icons/invite-friends-icon.svg',
                title: 'Invite Friends',
                onTap: () {},
              ),
              ProfileOptionItem(
                iconPath: 'assets/icons/terms-of-service-icon.svg',
                title: 'Terms of service',
                onTap: () {},
              ),
              ProfileOptionItem(
                iconPath: 'assets/icons/privacy-policy-icon.svg',
                title: 'Privacy Policy',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
