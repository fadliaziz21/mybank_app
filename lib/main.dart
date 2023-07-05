import 'package:flutter/material.dart';
import 'package:mybank_app/constans/colors.dart';
import 'package:mybank_app/constans/font_family.dart';
import 'package:mybank_app/features/dashboard/dashboard_screen.dart';
import 'package:mybank_app/features/onboarding/onboarding_screen.dart';
import 'package:mybank_app/features/pin/pin_screen.dart';
import 'package:mybank_app/features/transaction_history/transaction_history_screen.dart';

void main() {
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
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const OnBoardingPage(),
      // home: const PinPage(),
      // home: const DashboardPage(),
      // home: const TransactionHistoryPage(),
      initialRoute: '/transaction-history',
      routes: {
        '/': (context) => const OnBoardingPage(),
        '/home': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/pin': (context) => const PinPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/transaction-history': (context) => const TransactionHistoryPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
