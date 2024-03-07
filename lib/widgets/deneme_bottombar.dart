// import 'package:bee_store/pages/categorys.dart';
// import 'package:bee_store/pages/home.dart';
// import 'package:bee_store/pages/order.dart';
// import 'package:bee_store/pages/profile.dart';
// import 'package:flutter/material.dart';

// class AppBottomNavigationBar extends StatefulWidget {
//   @override
//   _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
// }

// class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
//   // BottomAppBar
//   int _currentIndex = 0;

//   void _navigateBottomBar(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   // BottomNavigationBar sayfa değiştirme
//   final List<Widget> _pages = [
//     UserHome(),
//     UserCategorys(),
//     UserOrder(),
//     UserProfile(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[
//           _currentIndex], // Sayfa içeriğini göstermek için _currentIndex kullanılıyor
//       bottomNavigationBar: BottomNavigationBar(
//         // type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         iconSize: 24,
//         selectedFontSize: 10,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category_outlined),
//             label: "Categorys",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_outlined),
//             label: "Orders",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_2_outlined),
//             label: "Profile",
//           ),
//         ],
//         onTap: _navigateBottomBar,
//         backgroundColor: Colors.white,
//         selectedItemColor: Color.fromARGB(255, 78, 65, 65),
//         unselectedItemColor: Color.fromARGB(255, 175, 175, 175),
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//       ),
//     );
//   }
// }
