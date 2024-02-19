import 'package:flutter/material.dart';

class InspectScreen extends StatefulWidget {
  final String heroTag;
  final String imageAddress;
  final double usdPrice;

  InspectScreen(
      {required this.heroTag,
      required this.imageAddress,
      required this.usdPrice});

  @override
  _InspectScreenState createState() => _InspectScreenState();
}

class _InspectScreenState extends State<InspectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inspect Screen'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Hero(
            tag: widget.heroTag,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                widget.imageAddress,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 8.0), // buraya bakarsın bi
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${widget.usdPrice}  ", // Ürün fiyatını buraya ekleyin
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
