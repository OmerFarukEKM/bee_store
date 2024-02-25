import 'package:flutter/material.dart';

class InspectScreen extends StatefulWidget {
  final String heroTag;
  final String imageAddress;
  final double usdPrice;

  InspectScreen({
    required this.heroTag,
    required this.imageAddress,
    required this.usdPrice,
  });

  @override
  _InspectScreenState createState() => _InspectScreenState();
}

class _InspectScreenState extends State<InspectScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // App bar'ın vücut arkasında uzanmasını sağlar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Inspect Screen'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                // Kalp ikonuna tıklanınca durumu tersine çevir
                isFavorite = !isFavorite;
              });
              // İşlemlerinizi buraya ekleyin
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              // Paylaşma işlemlerini buraya ekleyin
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.share,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Hero(
              tag: widget.heroTag,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Image.asset(
                  widget.imageAddress,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                          "Calvin Klein",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 16.0,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                          "Calvin Klein Regular fit slim fit shirt",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Container(
                          height: 20,
                          width: 48,
                          decoration: BoxDecoration(
                              // decorationla beraber yapabiliyorsun bunları böyle şeyleri unutma
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 252, 109, 0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_border_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                              Text(
                                " 4,7",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Row(
                      children: [
                        Text(
                          "\$35 ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$136 ",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w200,
                              fontSize: 12,
                              color: Colors.grey[400]),
                        ),
                        Text(
                          "15% OFF",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${widget.usdPrice}  ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Şimdi Al butonuna tıklanınca yapılacak işlemleri buraya ekleyin
                    },
                    child: Text("Şimdi Al"),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Sepete Ekle butonuna tıklanınca yapılacak işlemleri buraya ekleyin
                    },
                    child: Text("Sepete Ekle"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
