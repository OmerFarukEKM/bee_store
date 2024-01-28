import 'package:flutter/material.dart';

void main() {
  print("Hello World");
  islem(selamlamaMetini, sayi);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDebug = false;
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
                  Colors.black, // Siyah rengi
                  BlendMode.srcIn, // Kaynak görüntü ile karıştırma modu
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
        body: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search Anything...",
                  prefixIcon: Image.asset("assets/search.png"),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide(
                      color: const Color(0xFF1F2937),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
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
                  Spacer(), // belirli bir uzaklık yok onu anlatıyor ekranın boyutuna göre değişiyor
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
              
              child:
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                
                 child: Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                        icon: Image.asset("assets/dress.png"),
                        onPressed: () {},
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Fashion",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                        icon: Image.asset("assets/electronic.png"),
                         onPressed: () {},
                          ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Electronic",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                        icon: Image.asset("assets/appliances.png"),
                        onPressed: () {},
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Appliances",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                        icon: Image.asset("assets/beauty.png"),
                        onPressed: () {},
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Beauty",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                        )
                      ],
                    ),
                   Column(  // alt alta stün şeklinde yapmak için
                     children: [
                       Stack( //Stack widget, Flutter'da kullanılan bir yapıdır ve içindeki widget'ları üst üste yerleştirmek için kullanılır. Bir Stack içindeki widget'lar, ekranın üstünde birbirinin üzerine konumlandırılır. Stack içindeki widget'lar birbiriyle çakışabilir veya örtüşebilir.
                         alignment: Alignment.center, // ortalamak için
                         children: [
                           Container(
                             width: 48,
                             height: 48,
                             decoration: const ShapeDecoration(
                               color: Color(0xFFECFDF5),
                               shape: CircleBorder(),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: IconButton(
                               icon: const Icon(Icons.home),
                               onPressed: () {},
                               color: const Color.fromARGB(255, 91, 101, 118),
                             ),
                           ),
                         ],
                       ),
                       const SizedBox(height: 8),
                       const Text(
                         'Furniture',
                         style: TextStyle(
                           color: Color(0xFF1F2937),
                           fontSize: 12,
                           fontFamily: 'Inter',
                           fontWeight: FontWeight.w400,
                           height: 0.12,
                         ),
                       ),
                     ],
                   ),
                  ],
                               ),
               ),
            ),
          ],
        ),
        drawer: const Drawer(),
      ),
    );
  }
}



// veri tipi ve değişkenler
String selamlamaMetini = "Merhaba Arkadaşlar";
int sayi = 5;

void islem(String metin, int sayi) {
  for (int i = 0; i < sayi; i++) {
    print(metin);
  }
}


class Insan {
  String isim;
  String soyisim;
  int yas;
  double kilo;
  bool askerlikYaptiMi;
  List<int> okullaGecenYillari;

  Insan(this.isim, this.soyisim, this.yas, this.kilo, this.askerlikYaptiMi, this.okullaGecenYillari) {
    print("İnsan sınıfı oluşturuldu");
  }
}

class Ogrenci extends Insan {
  String okulno;
  String okulismi;

  Ogrenci(super.isim, super.soyisim, super.yas, super.kilo, super.askerlikYaptiMi, super.okullaGecenYillari, this.okulismi, this.okulno) {
    print("Ogrenci oluşturuldu");
  }
}
