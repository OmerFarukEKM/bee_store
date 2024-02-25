import 'package:bee_store/pages/home.dart';
import 'package:bee_store/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, snapshot) {
          final loginok = snapshot.hasData &&
              snapshot.data != null; // context ve snapshota bak tekrardan
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: loginok ? UserHome() : LoginPage(),
          );
        });
  }
}
