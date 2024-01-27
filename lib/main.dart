import 'package:flutter/material.dart';

void main() {
  print("Hello World");
  islem(selamlamaMetini, sayi);

  bool isDebug = false;



Widget myApp = MaterialApp(
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
                colorFilter: ColorFilter.mode(
                  Colors.black, // Siyah rengi
                  BlendMode.srcIn, // Kaynak görüntü ile karıştırma modu # tam anlamadım bunu ama olsun
                ),
                child: Image.asset("assets/bag-2.png",
              width: 24,
              height: 24,),
                
              ),
            )

          ],
        ),
        body: const Center(
          child: Text(
            "Merhaba ?",
            style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
          ),
        ),
        drawer: const Drawer(),
      ),
    );
runApp(myApp);    
}


// veri tipi ve değişkenler
String selamlamaMetini = "Merhaba Arkadaşlar";
int sayi = 5;

void islem(String metin, int sayi) {
  for (int i = 0; i < sayi; i++) {
    print(metin);
  }
}
