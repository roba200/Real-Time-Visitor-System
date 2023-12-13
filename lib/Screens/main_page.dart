import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visitor_counting_system/Screens/category_page.dart';
import 'package:visitor_counting_system/Screens/login_or_sign_up_page.dart';
import 'package:visitor_counting_system/Screens/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CategoryPage();
          } else {
            return LoginOrSignUpPage();
          }
        },
      ),
    );
  }
}
