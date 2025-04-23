import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import file internal
import 'controller/auth_controller.dart';
import 'view/dashboard_page.dart';
import 'view/login_page.dart';
import 'view/profile_page.dart';
import 'view/counter_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthController())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true, // opsional, kalau kamu pakai Material 3
      ),
      initialRoute:
          '/', // bisa ganti ke '/login' kalau mau mulai dari login page
      routes: {
        '/': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/counter': (context) => const CounterPage(),
        '/profile': (context) => const ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
