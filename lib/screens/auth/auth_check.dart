import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare_doctor/screens/auth/login_screen.dart';
import 'package:medicare_doctor/screens/main/main_dashboard.dart';

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          // If user is logged in, navigate to MainDashboard
          return MainDashboard();
        } else {
          // If not logged in, navigate to LoginScreen
          return LoginScreen();
        }
      },
    );
  }
}
