import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _loading = false;
  var _errorMessage = "";
  var _nameSurname = "";
  var _email = "";
  var _password = "";
  var _cart = [];
  // var _favorite =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("REGİSTER PAGE"))),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center, // bu zaten column da varsayılan oalrak böyle ama bu yatayda düşünüyor onu
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_errorMessage.isNotEmpty)
              Text(
                "ERROR: $_errorMessage ",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            TextField(
              decoration:
                  InputDecoration(hintText: "Enter your name and surname"),
              keyboardType: TextInputType
                  .name, // bu sayede uygulamaya girerken defult kayboard açılmıyorda @ olan açılıyor güzelmiş cidden
              onChanged: (value) {
                _nameSurname = value;
                setState(() {});
                if (_errorMessage.isNotEmpty) {
                  _errorMessage = "";
                }
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "E-mail adresini gir"),
              keyboardType: TextInputType
                  .emailAddress, // bu sayede uygulamaya girerken defult kayboard açılmıyorda @ olan açılıyor güzelmiş cidden
              onChanged: (value) {
                _email = value;
                setState(() {});
                if (_errorMessage.isNotEmpty) {
                  _errorMessage = "";
                }
              },
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Şifreni gir"),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (value) {
                _password = value;
                setState(() {});
                if (_errorMessage.isNotEmpty) {
                  _errorMessage = "";
                }
              },
            ),
            if (_loading)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              )
            else
              TextButton(
                onPressed: () {
                  final regexExp = RegExp(
                      r"^[A-Za-z0-9._+\-\']+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}$");
                  final isValid =
                      regexExp.hasMatch(_email) && _password.length > 5;
                  if (isValid && _nameSurname.isNotEmpty) {
                    _loading = true;
                    // bunları yapma sebebimiz çoklu tıklamanın önüne geçmek
                    setState(() {}); // tam olarak bu ne bak
                    // email validation kodları var doğruluğu kontrol etemk için bak istersen
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _email, password: _password)
                        .catchError(
                      (errorMessage) {
                        _errorMessage = errorMessage.toString();
                        _loading = false;
                        setState(() {});
                      },
                    ).then((value) async {
                      final uid = value.user?.uid;
                      final userData = {
                        "name": _nameSurname,
                        "email": _email,
                        //"password": _password, // tehlikeli dendi
                        "registerDate": FieldValue.serverTimestamp(),
                        "cart": _cart
                      };
                      if (uid == null) {
                        await FirebaseFirestore.instance
                            .collection("users")
                            .add(userData);
                      } else {
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(uid)
                            .set(
                                userData); // bir dosyayı değiştirmek için iki tane deerimiz var bi update bide set methodlarımız update sadece ilgili bölümü değiştirir ve önceden var olması gerekir set de ise yoksa kendisi oluşturur
                      }
                      if (mounted)
                        Navigator.of(context)
                            .pop(); // önceki sayfaya gideceğiz // monted var mı yok mu onun için var
                    });
                  } else {
                    _errorMessage =
                        "All e-mail address, password, name and surname information is required";
                    setState(() {});
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text("Register"),
                ),
              ), // buttonların şekillerni öğren
          ],
        ),
      ),
    );
  }
}
