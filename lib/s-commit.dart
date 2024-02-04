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
              child: SingleChildScrollView(      // çalışmıyor !
                scrollDirection: Axis.horizontal,
                 // ikinci bir row açtık nedenini bul
                child : Row(
                children: [
                for (int i = 0; i < 3; i++)
                Row( 
                                 
                  children: [                    
                      _buildCategoryButton("assets/dress.png", "Fashion"),                 
                      _buildCategoryButton("assets/electronic.png", "Electronic"),                    
                      _buildCategoryButton("assets/appliances.png", "Appliances"),      
                      _buildCategoryButton("assets/beauty.png", "Beauty"),
                      _buildCategoryButton("assets/furniture_3.png", "Furniture"),
                      
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

  Widget _buildCategoryButton(String imagePath, String label) {
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
         Padding( // const olunca label hata verdi nedenini bilmiyoum sildik düzeldi
          padding: EdgeInsets.all(8.0),
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
