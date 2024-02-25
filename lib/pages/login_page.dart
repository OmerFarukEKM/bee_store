import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _yukleniyor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .center, // bu zaten column da varsayılan oalrak böyle ama bu yatayda düşünüyor onu
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
                  "Login Page")), // burdaki centerda gerekli sayfanın tam en ortasına gelmesi için
          if (_yukleniyor)
            CircularProgressIndicator()
          else
            TextButton(
              onPressed: () {
                _yukleniyor =
                    true; // bunları yapma sebebimiz çoklu tıklamanın önüne geçmek
                setState(() {}); // tam olarak bu ne bak
                FirebaseAuth.instance.signInAnonymously();
              },
              child: Text("LOGİN"),
            ) // buttonların şekillerni öğren
        ],
      ),
    );
  }
}
