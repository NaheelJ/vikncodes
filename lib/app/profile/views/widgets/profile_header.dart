import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vikncodes/app/profile/controllers/profile_provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, child) {
        final userProfile = profileProvider.userProfile;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(33),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(33),
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
                                const Icon(Icons.person, color: Colors.white, size: 40),
                          )
                        : const Icon(Icons.person, color: Colors.white, size: 40),
              ),
            ),
            const SizedBox(width: 19),
            // Name & Email
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userProfile?.fullName ?? "Guest User",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    userProfile?.email ?? "No email available",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFB5CDFE),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Edit Icon
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // TODO: Implement edit functionality
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    'assets/icons/edit-icon.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
