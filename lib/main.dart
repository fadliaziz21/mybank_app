import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/font_family.dart';
import 'package:mybank_app/features/dashboard/dashboard_screen.dart';
import 'package:mybank_app/features/help_center/help_center_screen.dart';
import 'package:mybank_app/features/login/login_screen.dart';
import 'package:mybank_app/features/onboarding/onboarding_screen.dart';
import 'package:mybank_app/features/pin/pin_screen.dart';
import 'package:mybank_app/features/profile/profile_screen.dart';
import 'package:mybank_app/features/transaction_history/transaction_history_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;

void main() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt('initScreen');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        fontFamily: FontFamily.montserrat,
      ),
      initialRoute: initScreen == null || initScreen == 0
          ? '/'
          : initScreen == 1
              ? '/login'
              : '/pin',
      routes: {
        '/': (context) => const OnBoardingPage(),
        '/login': (context) => const LoginPage(),
        '/pin': (context) => const PinPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/transaction-history': (context) => const TransactionHistoryPage(),
        '/help-center': (context) => const HelpCenterPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
