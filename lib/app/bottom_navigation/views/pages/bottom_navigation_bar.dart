import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/app/bottom_navigation/controllers/dashboard_provider.dart';
import 'package:vikncodes/app/home/views/pages/home_page.dart';
import 'package:vikncodes/app/route/views/pages/route_page.dart';
import 'package:vikncodes/app/notification/views/pages/notification_page.dart';
import 'package:vikncodes/app/profile/views/pages/profile_page.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  static const String routeName = "/bottomNavigationBar";

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    
    final List<Widget> screens = [
      const HomePage(),
      const RoutePage(),
      const NotificationPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: dashboardProvider.selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: const _CustomBottomNavBar(),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar();

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(context);
    final int currentIndex = dashboardProvider.selectedIndex;

    final List<String> icons = [
      'assets/icons/home-icon.svg',
      'assets/icons/reels-icon.svg',
      'assets/icons/notification-icon.svg',
      'assets/icons/profile-icon.svg',
    ];

    return Container(
      height: 80 + MediaQuery.of(context).padding.bottom,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: SafeArea(
        bottom: true,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double itemWidth = constraints.maxWidth / 4;
            return Stack(
              children: [
                // Icons Row
                Row(
                  children: List.generate(icons.length, (index) {
                    bool isSelected = currentIndex == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => dashboardProvider.setIndex(index),
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: SvgPicture.asset(
                            icons[index],
                            height: 24,
                            width: 24,
                            colorFilter: ColorFilter.mode(
                              isSelected ? Colors.white : Colors.white.withValues(alpha: 0.4),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                // Animated Dot Indicator
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: (currentIndex * itemWidth) + (itemWidth / 2) - 3,
                  bottom: 12,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
