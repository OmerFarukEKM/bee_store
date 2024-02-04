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
  bool isDebug = false;
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
    // Hedef an
    DateTime targetDate = DateTime(2024, 12, 31, 23); // yıl ay gün saat :D
    ////Tekrar dedin sayaç(zamana bağlı işlemler için)
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {
    //     int nextPage = (controller.page?.round() ?? 0) + 1;
    //     if (nextPage > 4) {
    //       nextPage = 0;
    //     }
    //     if (sayac == 8) {
    //       controller.animateToPage(nextPage,
    //           duration: Duration(microseconds: 500), curve: Curves.ease);
    //       sayac = 0;
    //     }
    //     sayac++;
    //     _timeUntilTarget = targetDate.difference(DateTime.now());
    //   });
    // });
    //Hedef ana kalan sürenin hesaplandığı yer
    _timeUntilTarget = targetDate.difference(DateTime.now());
    // Initialize the PageController
    controller = PageController(initialPage: 0);

    // Automatic banner change timer
    Timer.periodic(Duration(seconds: 1), (timer) {
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
    });

    // Page change listener
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
        switch (currentPage) {
          case 0:
            dot1 = Color.fromRGBO(29, 78, 216, 1);
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
    return MaterialApp(
      debugShowCheckedModeBanner: isDebug,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              iconSize: 24,
            ),
            IconButton(
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
          ],
        ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      for (int i = 0; i < 3; i++)
                        Row(
                          children: [
                            _buildCategoryButton("assets/dress.png", "Fashion"),
                            _buildCategoryButton(
                                "assets/electronic.png", "Electronic"),
                            _buildCategoryButton(
                                "assets/appliances.png", "Appliances"),
                            _buildCategoryButton("assets/beauty.png", "Beauty"),
                            _buildCategoryButton(
                                "assets/furniture_3.png", "Furniture"),
                          ],
                        ),
                    ],
                  ),
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
                height: 436,
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
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(255, 239, 68, 68),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        drawer: const Drawer(),
      ),
    );
  }

  Widget _buildCategoryButton(String imagePath, String label) {
    return Row(
      children: [
        _buildSingleCategoryButton(imagePath, label),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSingleCategoryButton(String imagePath, String label) {
    return Column(
      children: [
        IconButton(
          icon: Image.asset(
            imagePath,
            width: 48,
            height: 48,
          ),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1F2937),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0.12,
            ),
          ),
        ),
      ],
    );
  }

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

// class Insan {
//   String isim;
//   String soyisim;
//   int yas;
//   double kilo;
//   bool askerlikYaptiMi;
//   List<int> okullaGecenYillari;

//   Insan(this.isim, this.soyisim, this.yas, this.kilo, this.askerlikYaptiMi,
//       this.okullaGecenYillari) {
//     print("İnsan sınıfı oluşturuldu");
//   }
// }

// class Ogrenci extends Insan {
//   String okulno;
//   String okulismi;

//   Ogrenci(
//       String isim,
//       String soyisim,
//       int yas,
//       double kilo,
//       bool askerlikYaptiMi,
//       List<int> okullaGecenYillari,
//       this.okulismi,
//       this.okulno)
//       : super(isim, soyisim, yas, kilo, askerlikYaptiMi, okullaGecenYillari) {
//     print("Ogrenci oluşturuldu");
//   }
// }