import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/app/invoice/controllers/invoice_provider.dart';

class StatusFilterSection extends StatelessWidget {
  const StatusFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _StatusPill(status: "Pending"),
          SizedBox(width: 8),
          _StatusPill(status: "Invoiced"),
          SizedBox(width: 8),
          _StatusPill(status: "Cancelled"),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String status;

  const _StatusPill({required this.status});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InvoiceProvider>();
    final isSelected = provider.selectedStatuses.contains(status);
    return Expanded(
      child: GestureDetector(
        onTap: () => provider.toggleStatus(status),
        child: Container(
          height: 43,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF2979FF) : const Color(0xFF1B2B30),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              status,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
