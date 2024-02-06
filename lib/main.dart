import 'package:bee_store/pages/categorys.dart';
import 'package:bee_store/pages/home.dart';
import 'package:bee_store/pages/order.dart';
import 'package:bee_store/pages/profile.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Add this import for Timer

void main() {
  print("Hello World");
  islem(selamlamaMetini, sayi);
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

  // Widget _buildCategoryButton(String imagePath, String label) {
  //   return Row(
  //     children: [
  //       _buildSingleCategoryButton(imagePath, label),
  //       const SizedBox(width: 8),
  //     ],
  //   );
  // }

  // Widget _buildSingleCategoryButton(String imagePath, String label) {
  //   return Column(
  //     children: [
  //       IconButton(
  //         icon: Image.asset(
  //           imagePath,
  //           width: 48,
  //           height: 48,
  //         ),
  //         onPressed: () {},
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Text(
  //           label,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             color: Color(0xFF1F2937),
  //             fontSize: 12,
  //             fontFamily: 'Inter',
  //             fontWeight: FontWeight.w400,
  //             height: 0.12,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Data types and variables
  String selamlamaMetini = "Merhaba Arkadaşlar";
  int sayi = 5;

  // Timer for automatic banner change
  late Timer bannerTimer;

  // Target date for the countdown
  late DateTime targetDate;

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
