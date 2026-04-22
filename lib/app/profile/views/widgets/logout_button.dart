import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:vikncodes/app/auth/controllers/auth_provider.dart';
import 'package:vikncodes/app/auth/views/pages/login_page.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: () async {
          await Provider.of<AuthProvider>(
            context,
            listen: false,
          ).logout();
          if (context.mounted) {
            context.go(LoginPage.routeName);
          }
        },
        splashColor: Colors.white10,
        highlightColor: Colors.white12,
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          height: 67,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/logout-icon.svg',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              Text(
                "Logout",
                style: GoogleFonts.poppins(
                  color: const Color(0xFFE57373),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
