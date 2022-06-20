import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tunggu extends StatelessWidget {
  const Tunggu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF1b33e3),
        body: Center(
          child: Container(
            height: Get.height * 0.5,
            width: Get.width * 0.5,
            child: Image.asset("assets/logo/logo.png"),
          ),
        ),
      ),
    );
  }
}
