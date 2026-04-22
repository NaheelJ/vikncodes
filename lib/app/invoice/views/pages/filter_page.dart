import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vikncodes/app/invoice/views/widgets/customer_filter_section.dart';
import 'package:vikncodes/app/invoice/views/widgets/date_filter_section.dart';
import 'package:vikncodes/app/invoice/views/widgets/status_filter_section.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  static const String routeName = "/filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        titleSpacing: 0,
        title: Text(
          "Filters",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.visibility_outlined,
              color: Color(0xFF2979FF),
              size: 20,
            ),
            onPressed: () {},
          ),
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              "Filter",
              style: GoogleFonts.poppins(
                color: const Color(0xFF2979FF),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(8),
          child: Divider(color: Color(0xFF1C3347), height: 1),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18),
            DateFilterSection(),
            SizedBox(height: 17),
            Divider(color: Color(0xFF1C3347), height: 1),
            SizedBox(height: 25),
            StatusFilterSection(),
            SizedBox(height: 25),
            CustomerFilterSection(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
