import 'package:flutter/material.dart';

class Promo extends StatelessWidget {
  const Promo({
    Key? key,
    required this.images,
  }) : super(key: key);

  final String images;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, right: 5),
          height: 150,
          child: Image.network('$images'),
        ),
      ],
    );
  }
}
