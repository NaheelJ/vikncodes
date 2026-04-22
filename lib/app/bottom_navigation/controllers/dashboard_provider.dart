import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  DateTime _selectedDate = DateTime(2023, 9, 2);
  DateTime get selectedDate => _selectedDate;
  
  int get daysInMonth {
    return DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
  }

  String get monthYearString {
    return DateFormat('MMMM yyyy').format(_selectedDate);
  }

  void setIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  void setDate(int day) {
    _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, day);
    notifyListeners();
  }

  void setMonthYear(int month, int year) {
    int lastDay = DateTime(year, month + 1, 0).day;
    int day = _selectedDate.day > lastDay ? lastDay : _selectedDate.day;
    
    _selectedDate = DateTime(year, month, day);
    notifyListeners();
  }
}
