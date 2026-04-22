import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/app/invoice/controllers/invoice_provider.dart';
import 'package:vikncodes/core/constants/app_constants.dart';

class CustomerFilterSection extends StatelessWidget {
  const CustomerFilterSection({super.key});

  void _showCustomerPicker(BuildContext context, InvoiceProvider provider) {
    final customers = AppConstants.dummyInvoices
        .map((e) => e['customerName'] as String)
        .toSet()
        .toList();

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0F0F0F),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Consumer<InvoiceProvider>(
          builder: (context, modalProvider, child) {
            return SafeArea(
              bottom: true,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Select Customers",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: customers.length,
                        itemBuilder: (context, index) {
                          final customer = customers[index];
                          final isSelected = modalProvider.selectedCustomers.contains(customer);
                          return ListTile(
                            title: Text(
                              customer,
                              style: GoogleFonts.poppins(
                                color: isSelected ? const Color(0xFF2979FF) : Colors.white,
                              ),
                            ),
                            trailing: isSelected ? const Icon(Icons.check, color: Color(0xFF2979FF)) : null,
                            onTap: () => modalProvider.toggleCustomer(customer),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2979FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            "Done",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InvoiceProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () => _showCustomerPicker(context, provider),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF08131E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF1C3347), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Customer",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF838383),
                      fontSize: 16,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Color(0xFF838383)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 22),
        Container(
          width: double.infinity,
          height: 1,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0x0008131E),
                Color(0xFF1C3347),
                Color(0x0008131E),
              ],
              stops: [0.0, 0.4844, 1.0],
            ),
          ),
        ),
        const SizedBox(height: 20),
        if (provider.selectedCustomers.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: provider.selectedCustomers.map((customer) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C2A2F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        customer,
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () => provider.removeCustomer(customer),
                        child: const Icon(Icons.close, color: Colors.white, size: 16),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
