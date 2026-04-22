import 'package:flutter/material.dart';
import 'package:vikncodes/core/constants/app_constants.dart';

class InvoiceProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _filteredInvoices = AppConstants.dummyInvoices;
  String _searchQuery = "";
  List<String> _selectedStatuses = [];
  List<String> _selectedCustomers = [];
  DateTime _fromDate = DateTime(2023, 9, 12);
  DateTime _toDate = DateTime(2023, 9, 12);

  List<Map<String, dynamic>> get filteredInvoices => _filteredInvoices;
  List<String> get selectedStatuses => _selectedStatuses;
  List<String> get selectedCustomers => _selectedCustomers;
  DateTime get fromDate => _fromDate;
  DateTime get toDate => _toDate;

  void setFromDate(DateTime date) {
    _fromDate = date;
    _applyFilters();
  }

  void setToDate(DateTime date) {
    _toDate = date;
    _applyFilters();
  }

  void filterBySearch(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void toggleStatus(String status) {
    if (_selectedStatuses.contains(status)) {
      _selectedStatuses.remove(status);
    } else {
      _selectedStatuses.add(status);
    }
    _applyFilters();
  }

  void toggleCustomer(String customer) {
    if (_selectedCustomers.contains(customer)) {
      _selectedCustomers.remove(customer);
    } else {
      _selectedCustomers.add(customer);
    }
    _applyFilters();
  }

  void removeCustomer(String customer) {
    _selectedCustomers.remove(customer);
    _applyFilters();
  }

  void resetFilters() {
    _searchQuery = "";
    _selectedStatuses = [];
    _selectedCustomers = [];
    _fromDate = DateTime(2023, 9, 12);
    _toDate = DateTime(2023, 9, 12);
    _applyFilters();
  }

  void _applyFilters() {
    final lowercaseQuery = _searchQuery.toLowerCase();
    
    _filteredInvoices = AppConstants.dummyInvoices.where((invoice) {
      // Search matching
      final matchesSearch = _searchQuery.isEmpty ||
          invoice['customerName'].toString().toLowerCase().contains(lowercaseQuery) ||
          invoice['invoiceNo'].toString().toLowerCase().contains(lowercaseQuery);

      // Status matching (OR logic)
      final matchesStatus = _selectedStatuses.isEmpty || _selectedStatuses.contains(invoice['status']);

      // Customer matching (OR logic)
      final matchesCustomer = _selectedCustomers.isEmpty || _selectedCustomers.contains(invoice['customerName']);

      return matchesSearch && matchesStatus && matchesCustomer;
    }).toList();
    
    notifyListeners();
  }
}
