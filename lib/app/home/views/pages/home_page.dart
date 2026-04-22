import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/app/profile/controllers/profile_provider.dart';
import 'package:vikncodes/app/invoice/views/pages/invoices_page.dart';
import 'package:vikncodes/app/home/views/widgets/home_app_bar.dart';
import 'package:vikncodes/app/home/views/widgets/revenue_analytics_card.dart';
import 'package:vikncodes/app/home/views/widgets/stat_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().loadUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
        child: Column(
          children: [
            const RevenueAnalyticsCard(),
            const SizedBox(height: 21),
            // Bookings Card
            StatCard(
              title: "Bookings",
              value: "123",
              subtitle: "Reserved",
              iconPath: "assets/icons/bookings-icon.svg",
              iconBgColor: const Color(0xFFF6EFED),
              iconColor: const Color(0xFF26413C),
              onTap: () {
              },
            ),
            const SizedBox(height: 16),
            // Invoices Card
            StatCard(
              title: "Invoices",
              value: "10,232.00",
              subtitle: "Rupees",
              iconPath: "assets/icons/invoice-icon.svg",
              iconBgColor: const Color(0xFFA9C9C5),
              iconColor: const Color(0xFF26413C),
              onTap: () {
                context.push(InvoicesPage.routeName);
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
