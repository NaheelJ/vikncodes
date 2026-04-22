import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vikncodes/app/bottom_navigation/controllers/dashboard_provider.dart';
import 'package:vikncodes/app/profile/controllers/profile_provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/App_banner_logo.png',
              width: 138,
              height: 34,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 11),
            Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                final userProfile = profileProvider.userProfile;
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<DashboardProvider>().setIndex(3);
                      },
                      child: Container(
                        width: 61,
                        height: 61,
                        decoration: BoxDecoration(
                          color: const Color(0xFF111111),
                          borderRadius: BorderRadius.circular(44),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(44),
                          child: profileProvider.isLoading
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey[900]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(color: Colors.black),
                                )
                              : (userProfile != null && userProfile.photo.isNotEmpty)
                                  ? Image.network(
                                      userProfile.photo,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) =>
                                          const Icon(Icons.person, color: Colors.white, size: 32),
                                    )
                                  : Icon(
                                      Icons.person,
                                      color: Colors.white.withOpacity(0.8),
                                      size: 32,
                                    ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 45,
                      top: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDB6E40),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFF0000).withOpacity(0.77),
                              blurRadius: 9,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
