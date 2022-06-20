import 'package:bookingapp/app/controllers/fcm_controller.dart';
import 'package:bookingapp/app/modules/home/views/home_view.dart';
import 'package:bookingapp/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/auth_controller.dart';

class AkunPage extends StatefulWidget {
  AkunPage({Key? key}) : super(key: key);

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  String dataC = "Tidak Ada Data";
  String titleC = "Tidak Ada Data";
  String bodyC = "Tidak Ada Data";

  @override
  void initState() {
    super.initState();
    final fcmC = FcmAuth();
    fcmC.setNotifikasi();

    fcmC.dataBrd.stream.listen(updateDataNotification);
    fcmC.titleBrd.stream.listen(updateTitleNotification);
    fcmC.bodyBrd.stream.listen(updateBodyNotification);
  }

  updateDataNotification(String pesan) => setState(() => dataC = pesan);
  updateTitleNotification(String pesan) => setState(() => titleC = pesan);
  updateBodyNotification(String pesan) => setState(() => bodyC = pesan);

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            "Data : $dataC",
            style: TextStyle(fontSize: 28),
          ),
          Text(
            "Title : $titleC",
            style: TextStyle(fontSize: 28),
          ),
          Text(
            "Body : $bodyC",
            style: TextStyle(fontSize: 28),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () => authC.Logout(),
            child: Text(
              "KELUAR",
              style: TextStyle(color: Colors.green, fontSize: 24),
            ),
          ),
          TextButton(
            onPressed: () => authC.subs(),
            child: Text(
              "Subscribe",
              style: TextStyle(color: Colors.green, fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
