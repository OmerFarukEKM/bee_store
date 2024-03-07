import 'package:bee_store/models/product_model.dart';
import 'package:bee_store/pages/categorys.dart';
import 'package:bee_store/pages/order.dart';
import 'package:bee_store/pages/profile.dart';
import 'package:bee_store/widgets/app_app_bar.dart';
import 'package:bee_store/widgets/app_drawer.dart';
import 'package:bee_store/widgets/category_widgets.dart';
import 'package:bee_store/widgets/home_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  bool isDebug = false;
  // BottomAppBar
  int _currentIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // BottomNavigationBar sayfa değiştirme
  final List<Widget> _pages = [
    // UserHome(),
    UserCategorys(),
    UserOrder(),
    UserProfile(),
  ];

  late PageController controller;
  int currentPage = 0;
  //Kalan süre değişkeni
  late Duration _timeUntilTarget;

  // Slider dot colors
  late Color dot1 = Color.fromRGBO(29, 78, 216, 1);
  late Color dot2 = Colors.grey;
  late Color dot3 = Colors.grey;
  late Color dot4 = Colors.grey;
  late Color dot5 = Colors.grey;

  // Slider automatic change counter
  int sayac = 0;

  @override
  void initState() {
    super.initState();
    // kendini tekar tekrar çağırmasın diye bunu ekledik
    _pages[0] = this.widget;
    // Hedef an
    DateTime targetDate = DateTime(2024, 12, 31, 23); // yıl ay gün saat :D

    ////Tekrar dedin sayaç(zamana bağlı işlemler için)

    /// Initialize the PageController
    controller = PageController(initialPage: 0);

    //Hedef ana kalan sürenin hesaplandığı yer

    // Automatic banner change timer
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int nextPage = (controller.page?.round() ?? 0) + 1;
        if (nextPage > 4) {
          nextPage = 0;
        }
        if (sayac == 8) {
          controller.animateToPage(nextPage,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
          sayac = 0;
        }
        sayac++;
      });
      sayac++;
      _timeUntilTarget = targetDate.difference(DateTime.now());
    });
    _timeUntilTarget = targetDate.difference(
        DateTime.now()); // bunu silince çalışmıyor ilginç bir şekilde
    // Page change listener
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
        switch (currentPage) {
          case 0:
            dot1 = const Color.fromRGBO(29, 78, 216, 1);
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = Colors.grey;
            break;
          case 1:
            dot1 = Colors.grey;
            dot2 = Color.fromRGBO(29, 78, 216, 1);
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = Colors.grey;
            break;
          case 2:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = Color.fromRGBO(29, 78, 216, 1);
            dot4 = Colors.grey;
            dot5 = Colors.grey;
            break;
          case 3:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = Color.fromRGBO(29, 78, 216, 1);
            dot5 = Colors.grey;
            break;
          case 4:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = Color.fromRGBO(29, 78, 216, 1);
            break;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // stateless ile statefull farkını bu ikisi ortaya çıkarıyor
    return // burdan matariel app kaldırınca bu appbar ve bottom bar olayı düzeldi
        // theme: ThemeData(useMaterial3: true), // çözemedim ne olduunu tam olarak
        Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search Anything...",
                  prefixIcon: Image.asset("assets/search.png"),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(
                      color: Color(0xFF1F2937),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1F2937),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.07,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All ->',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++)
                      FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection("categories")
                              .get(),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              final categoryList = snapshot.data!.docs
                                  .map((e) => e.data())
                                  .toList();

                              return Row(
                                children: [
                                  for (final data in categoryList)
                                    // future builder olunca bi build fonksiyonu yazıyorsun bi future fonksiyonu yazıyorssun future fonksiyonunde bir eşyi bekletebiliyorsun duration 3 minute dedin mesele o şey 3 dk sonra gerçekleşecek
                                    CategoryWidget(
                                        imageAddress: data["imageUrl"],
                                        caption: data["name"]),
                                ],
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                  ],
                ),
                //  child: Row(
                //   children: [
                //     for (int i = 0; i < 3; i++)
                //       Row(
                //         children: [
                //           _buildCategoryButton("assets/dress.png", "Fashion"),
                //           _buildCategoryButton(
                //               "assets/electronic.png", "Electronic"),
                //           _buildCategoryButton(
                //               "assets/appliances.png", "Appliances"),
                //           _buildCategoryButton("assets/beauty.png", "Beauty"),
                //           _buildCategoryButton(
                //               "assets/furniture_3.png", "Furniture"),
                //         ],
                //       ),
                //   ],
                // ),
              ),
            ),
            const SizedBox(height: 12),
            //Slider
            Container(
              width: double.infinity,
              height: 200,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: PageView(
                  controller: controller,
                  children: <Widget>[
                    /*
                      BoxFit.contain: Görüntüyü, container içine sığacak şekilde ölçeklendirir ve ortalar, oranını koruyarak.
                      BoxFit.cover: Görüntüyü, container'ın tamamını kaplayacak şekilde ölçeklendirir ve ortalar, oranını koruyarak.
                      BoxFit.fill: Görüntüyü, container'ın tamamını kaplayacak şekilde gerer ve oranını dikkate almaz.
                      BoxFit.fitHeight: Görüntüyü, container'ın yüksekliğine sığacak şekilde ölçeklendirir ve oranını korur.
                      BoxFit.fitWidth: Görüntüyü, container'ın genişliğine sığacak şekilde ölçeklendirir ve oranını korur.
                      BoxFit.none: Herhangi bir ölçekleme uygulamaz.
                      */
                    Center(
                      child: Image.asset("assets/banner1.png",
                          width: double.infinity, fit: BoxFit.fill),
                    ),
                    Center(
                      child: Image.asset("assets/banner2.png",
                          width: double.infinity, fit: BoxFit.fill),
                    ),
                    Center(
                      child: Image.asset("assets/banner3.png",
                          width: double.infinity, fit: BoxFit.fill),
                    ),
                    Center(
                      child: Image.asset("assets/banner1.png",
                          width: double.infinity, fit: BoxFit.fill),
                    ),
                    Center(
                      child: Image.asset("assets/banner2.png",
                          width: double.infinity, fit: BoxFit.fill),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: dot1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: dot2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: dot3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: dot4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: dot5,
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            const SizedBox(), // unutma ismiini
            Container(
              height: 650,
              width: double.infinity,
              color: Color.fromRGBO(246, 246, 246, 1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // tam olarak ne kadar gerekli olduğunu anlamadım ama bunu yazınca deal of yearı en başa aldı
                  /*
                      Bu durumda, Column içinde Row var. Row da yatay bir düzen içinde widget'ları sıralar. İçindeki Text widget'ları ve Spacer'ın yardımıyla, "Deal of the Year" başlığını ve "View All ->" metnini yatayda sıralar.

                      İşte bazı özelliklerin anlamları:

                      mainAxisSize: MainAxisSize.min: Bu, Row'un dikeyde ne kadar yer kaplayacağını belirler. min olarak ayarlandığında, sadece çocukları tarafından gerekli olan minimum dikey alanı kaplar. Yani, sadece içerik kadar yer kaplar.

                      Spacer(): Bu widget, çocukları arasında boşluğu esnek bir şekilde doldurur. Row içindeki Spacer, Deal of the Year ve View All -> arasında boşluğu ayarlar, böylece başlık sola, "View All ->" sağa hizalanır.

                      Column'un kullanılmasının nedeni, dikey sıralama yapmak ve içeriği düzenlemek içindir. Eğer sadece bir tek satır olsaydı, Column kullanmak gerekmezdi, ancak gelecekte içeriği genişletmek istenirse, Column eklemek daha esnek olabilir.
                    */

                  children: [
                    Row(
                      mainAxisSize: MainAxisSize
                          .min, // Adjusted to minimize vertical space
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Deal of the Year",
                            style: TextStyle(
                              color: Color.fromRGBO(31, 41, 55, 1),
                              fontSize: 14,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              height: 0.11,
                              letterSpacing: 0.07,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'View All ->',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 35,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 239, 68, 68),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${_timeUntilTarget.inDays} D ${_timeUntilTarget.inHours % 24} H ${_timeUntilTarget.inMinutes % 60} M ${_timeUntilTarget.inSeconds % 60} S",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: 525,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors
                                  .white, // bu ikonların oraya kadar gelsin kalan yer krem olsun bi ara yap bunu
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      DealOfYearWidget(
                                        imageAddress: "assets/snacker_deal.png",
                                        productTitle: "Running Shoes",
                                        discount: 40,
                                      ),
                                      DealOfYearWidget(
                                        discount: 60,
                                        productTitle: "Wrist Watches",
                                        imageAddress: "assets/watch.png",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      DealOfYearWidget(
                                        imageAddress: "assets/snacker_deal.png",
                                        productTitle: "Running Shoes",
                                        discount: 40,
                                      ),
                                      DealOfYearWidget(
                                        discount: 60,
                                        productTitle: "Wrist Watches",
                                        imageAddress: "assets/watch.png",
                                      ),
                                    ],
                                  ),
                                ], // <-- Add a comma here
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 880,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Hot selling footwear",
                          style: TextStyle(
                            // style bu abi type değil unutma
                            color: Color.fromRGBO(31, 41, 55, 1),
                            fontSize: 14,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            height: 0.11,
                            letterSpacing: 0.07,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "View all ->",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.12,
                          ),
                        ),
                      )
                    ],
                  ),
                  FutureBuilder(
                      // FutureBuilder<Object> böyle oludğundan hata veriyordu
                      future: FirebaseFirestore.instance
                          .collection("products")
                          .get(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          final products = snapshot.data!.docs.map((e) =>
                              ProductModel.fromFirestore(e.data(), e.id));
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              //   children: [ // burasını daha sonra kullanırsın doğru yapacağın zaman
                              //   Column(
                              //     children: [],
                              //   )
                              // ],

                              children: [
                                // for (int i = 0; i < 8; i++)
                                for (final product in products)
                                  // ImageIcon(
                                  //   AssetImage(
                                  //       "assets/footwear.png"), //böyle bir kullanımı daha önce yapmamıştık
                                  //   size: 200,
                                  //   color: Colors.transparent,
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: HomeWidgets(
                                      product: product,
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Recomended for you",
                          style: TextStyle(
                            color: Color.fromRGBO(31, 41, 55, 1),
                            fontSize: 14,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            height: 0.11,
                            letterSpacing: 0.07,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "View all ->",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.12,
                          ),
                        ),
                      )
                    ],
                  ),
                  FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection("products")
                          .get(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          final products = snapshot.data!.docs.map((e) =>
                              ProductModel.fromFirestore(e.data(), e.id));
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (final product in products)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: HomeWidgets(
                                      product: product,
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      appBar: AppAppBar(),
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
    );
  }
}
