import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/app/invoice/controllers/invoice_provider.dart';
import 'package:vikncodes/app/invoice/views/pages/filter_page.dart';
import 'package:vikncodes/app/invoice/views/widgets/invoice_tile.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({super.key});

  static const String routeName = "/invoices";

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InvoiceProvider>().resetFilters();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<InvoiceProvider>().filterBySearch(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final invoiceProvider = context.watch<InvoiceProvider>();
    final filteredInvoices = invoiceProvider.filteredInvoices;

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
          "Invoices",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(8),
          child: Divider(color: Color(0xFF1C3347), height: 1),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            // Search & Filter Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF08131E),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF1C3347)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/invoice-search-icon.svg',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: GoogleFonts.poppins(
                                  color: const Color(0xFF565656),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      context.push(FilterPage.routeName);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B2B30),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/filter-icon.svg',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 9),
                          Text(
                            "Add Filters",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xFF1C3347), height: 1),
            // Invoices List
            Expanded(
              child: ListView.builder(
                itemCount: filteredInvoices.length,
                itemBuilder: (context, index) {
                  final invoice = filteredInvoices[index];
                  return InvoiceTile(
                    invoiceNo: invoice['invoiceNo'],
                    customerName: invoice['customerName'],
                    status: invoice['status'],
                    statusColor: invoice['statusColor'],
                    amount: invoice['amount'],
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
