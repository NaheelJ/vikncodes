import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vikncodes/app/auth/controllers/auth_provider.dart';
import 'package:vikncodes/app/bottom_navigation/controllers/dashboard_provider.dart';

import 'package:vikncodes/app/invoice/controllers/invoice_provider.dart';
import 'package:vikncodes/app/profile/controllers/profile_provider.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
  ChangeNotifierProvider(create: (_) => DashboardProvider()),
  ChangeNotifierProvider(create: (_) => InvoiceProvider()),
  ChangeNotifierProvider(create: (_) => ProfileProvider()),
];
