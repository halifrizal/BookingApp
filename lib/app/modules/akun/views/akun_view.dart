import 'package:bookingapp/app/modules/akun/views/dataAkun.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/akun_controller.dart';

class AkunView extends GetView<AkunController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ini Menu Akun'),
        centerTitle: true,
      ),
      body: AkunPage(),
    );
  }
}
