import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/qr_checkin_screen.dart';
import 'screens/leave_request_screen.dart';
import 'screens/time_tracking_screen.dart';
import 'screens/employee_info_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/account_management_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQL Server Auth App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/admin',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/home': (_) => const HomeScreen(),
        '/qr-checkin': (_) => const QRCheckInScreen(),
        '/leave-request': (_) => const LeaveRequestScreen(),
        '/time-tracking': (_) => const TimeTrackingScreen(),
        '/employee-info': (_) => const EmployeeInfoScreen(),
      },
    );
  }
}