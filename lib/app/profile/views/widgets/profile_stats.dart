import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Rating Card
        const Expanded(
          child: _SmallStatCard(
            iconPath: 'assets/icons/rating-stars-icon.svg',
            iconBgColor: Color(0xFFB5CDFE),
            title: "4.3",
            subtitle: "rides",
            count: "2,211",
            icon: Icons.star_rounded,
            iconSize: 12,
            subtitleColor: Color(0xFFB5CDFE),
          ),
        ),
        const SizedBox(width: 12),
        // KYC Card
        const Expanded(
          child: _SmallStatCard(
            iconPath: 'assets/icons/kyc-icon.svg',
            iconBgColor: Color(0xFFA9C9C5),
            title: "KYC",
            subtitle: "Verified",
            icon: Icons.check_circle_outline_rounded,
            iconSize: 10,
            subtitleColor: Color(0xFFA9C9C5),
          ),
        ),
      ],
    );
  }
}

class _SmallStatCard extends StatelessWidget {
  final String iconPath;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final IconData icon;
  final double iconSize;
  final String count;
  final Color subtitleColor;

  const _SmallStatCard({
    required this.iconPath,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconSize,
    this.count = '',
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Action for stat card
        },
        borderRadius: BorderRadius.circular(33),
        child: Container(
          height: 107,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(33),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icon Pill
              Container(
                width: 40,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF26413C),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 2.5),
                        Icon(icon, color: Colors.white, size: iconSize),
                      ],
                    ),
                    if (count.isNotEmpty)
                      Text(
                        count,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF565656),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        color: subtitleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
