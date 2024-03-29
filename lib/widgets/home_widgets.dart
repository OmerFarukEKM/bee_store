import 'package:bee_store/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:bee_store/pages/inspect_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// flutter eğitim 3. video
class HomeWidgets extends StatefulWidget {
  const HomeWidgets({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  State createState() => _HomeWidgetsState();
}

/*
State createState(){
return _HomeWidgetsState();
}
*/
class _HomeWidgetsState extends State<HomeWidgets> {
  // widget diyince bundan bahssettiğimiz belli

// defult olarak fals
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () {
          // Burada tıklanınca yönlendirme yapabilirsiniz.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InspectScreen(
                heroTag:
                widget.product.uid, // Her resmin eşsiz bir etiketi olmalı
                imageAddress: widget.product.imageAddress,
                usdPrice: widget.product.usdPrice,
                product:
                    widget.product,
                 // ProductModel'i InspectScreen'e iletin
              ),
              fullscreenDialog:
                  false, // defult olarak böyle geliyor zaten heralde
            ),
          );
        },
        child: Hero(
          tag: widget
              .product.uid, // burda resminin olsı daha mantıklı olmaz mı ?
          child: Container(
            width: 148,
            height: 165,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),

            // kenarı ovel ve aşşağıya gölge bırakıyor bilmek laızm böyle şeyleri
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      // sorun burda dostum Image.asset değil Image.network debug konsoldan çözdüm sorunu aferin sana
                      widget.product.imageAddress,
                      // width: double.infinity,
                      // fit: BoxFit.fill,
                    ),
                    Positioned(
                      // Positioned.fill(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        onPressed: () {
                          // final user = FirebaseAuth.instance.currentUser!;
                          // FirebaseFirestore.instance
                          //     .collection("users")
                          //     .doc(user.uid)
                          //     .update({
                          //   "cart": FieldValue.arrayUnion([widget.product.uid])
                          // });

                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon: Icon(
                          isFavorite // çok ilginçmiş öğren burayı
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isFavorite ? Colors.red : null,
                        ),
                      ),
                    ),
                    // Positioned(
                    //   // Positioned.fill(
                    //   right: 20,
                    //   top: 0,
                    //   child: IconButton(
                    //     onPressed: () {
                    //       setState(() {
                    //         isFavorite = !isFavorite;
                    //       });
                    //     },
                    //     icon: Icon(
                    //       isFavorite // çok ilginçmiş öğren burayı
                    //           ? Icons.shopping_bag
                    //           : Icons.shopping_bag_outlined,
                    //       color: isFavorite
                    //           ? Color.fromARGB(255, 0, 13, 255)
                    //           : null,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Text(widget.product.titleSnackers),
                Row(
                  children: [
                    Text(
                      "\$${widget.product.usdPrice - (widget.product.usdPrice * widget.product.discount / 100).toInt()}  ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      /*
              w100: Çok ince yazı tipi.
              w200: İnce yazı tipi.
              w300: Hafif yazı tipi.
              w400: Normal (normal) yazı tipi. Bu genellikle kullanılan varsayılan değerdir.
              w500: Orta kalınlıkta (medium) yazı tipi.
              w600: Kalın yazı tipi.
              w700: Çok kalın yazı tipi. bold buraya giriyor heralde
              w800: Ağır yazı tipi.
              w900: Çok ağır yazı tipi.
                    */
                    ),
                    Text(
                      "\$${widget.product.usdPrice}  ",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                          color: Colors.grey[400]),
                    ),
                    Text(
                      "${widget.product.discount}% OFF",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////// Farklı bir grubu aynı sayfada oluşturman mümkün
////////////////////////////////////////////////////////////////////

/*
var
const
final
*/

class DealOfYearWidget extends StatefulWidget {
  const DealOfYearWidget(
      {super.key,
      required this.discount,
      required this.productTitle,
      required this.imageAddress});

  final String imageAddress;
  final String productTitle;
  final double discount;

  @override
  State createState() => _DealOfYearWidgetsState();
}

class _DealOfYearWidgetsState extends State<DealOfYearWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              widget.imageAddress, //*!?
              height: 140,
              width: 140,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.productTitle,
              textAlign: TextAlign.center, // alışmak gerekiyor bunlara
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                // fontSize:
              ),
            ),
          ),
          Container(
            height: 25,
            width: 100,
            decoration: BoxDecoration(
                // decorationla beraber yapabiliyorsun bunları böyle şeyleri unutma
                borderRadius: BorderRadius.circular(5),
                color: Colors.red),
            child: Center(
              child: Text(
                " Upto ${widget.discount}% OFF ",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
