
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/core/bootstrap/provider_init.dart';
import 'package:vikncodes/core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp.router(
        title: 'Vikn Codes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
          useMaterial3: true,
        ),
        scaffoldMessengerKey: scaffoldMessengerKey,
        routerConfig: AppRouter.router,
      ),
    );
  }
}