import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String imageAddress;
  final String caption;

  CategoryWidget({
    required this.imageAddress,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imageAddress.isNotEmpty)
          IconButton(
            icon: Image.network(
              // iconbutton kullanınca ımage.asseti icon : içine almayı unutma!
              imageAddress,
              width: 48,
              height: 48,
            ),
            onPressed: () {},
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            caption,
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
