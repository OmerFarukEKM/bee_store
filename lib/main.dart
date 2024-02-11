import 'package:bee_store/firebase_options.dart';
import 'package:bee_store/pages/categorys.dart';
import 'package:bee_store/pages/home.dart';
import 'package:bee_store/pages/order.dart';
import 'package:bee_store/pages/profile.dart';
import 'package:firebase_core/firebase_core.dart'; // 4. videoda bunlar anlatıldı
import 'package:flutter/material.dart';

Future<void> main() async {
  print("Hello World");
  islem(selamlamaMetini, sayi);
  WidgetsFlutterBinding
      .ensureInitialized(); // herşeyin düzgün olduğundan emin ol anlamına geliyor
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    // bunu kullanabilmek için feture kısmını ekledik ve async yaptık // current platform hangi platforma çağrılırsa onun ayarlarını getir burdan fairbase bizim kim olduğumuzu bilir
  } catch (error) {
    print(error);
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //BottomAppBar
  int _currentIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  // bottombar sayfa değiştirme

  // final List<Widget> // sayfaları ayırmayı öğren kodları böyle yazılmıyor heralde
  final List<Widget> _pages = [
    UserHome(),
    UserCategorys(),
    UserOrder(),
    UserProfile(),
  ];

  @override
  void initState() {
    // ne işe yaradığını bilmiyorum
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(useMaterial3: true), // çözemedim ne olduunu tam olarak

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentIndex],
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined),
              iconSize: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {},
                icon: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    "assets/bag-2.png",
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: const Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          // fixedColor: Colors.white,
          currentIndex: _currentIndex,
          iconSize: 24,
          selectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons
                  .category_outlined), // icon: Icon(Icons. içerdekinde s var unutma bunları
              label: "Categorys",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Profile",
            ),
          ],
          onTap: _navigateBottomBar,
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromARGB(255, 78, 65, 65),
          unselectedItemColor: Color.fromARGB(255, 175, 175, 175),
          showSelectedLabels: true,
          showUnselectedLabels:
              true, // sadece seçilen ögenin ismi gözükmeyecek hepsi gözükecek
        ),
      ),
    );
  }

  void islem(String metin, int sayi) {
    for (int i = 0; i < sayi; i++) {
      print(metin);
    }
  }
}

// Data types and variables
String selamlamaMetini = "Merhaba Arkadaşlar";
int sayi = 5;

void islem(String metin, int sayi) {
  for (int i = 0; i < sayi; i++) {
    print(metin);
  }
}
