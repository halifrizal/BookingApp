import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FcmAuth {
  FirebaseMessaging fcm = FirebaseMessaging.instance;
  final dataBrd = StreamController<String>.broadcast();
  final bodyBrd = StreamController<String>.broadcast();
  final titleBrd = StreamController<String>.broadcast();

  void setNotifikasi() async {
    NotificationSettings setting = await fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      foregroundNotif();
      backgroundNotif();
      terminatedNotif();
    }

    final token =
        fcm.getToken().then((value) => print("INI DATA TOKEN : $value"));
  }

  foregroundNotif() {
    FirebaseMessaging.onMessage.listen((event) {
      print("Ini Notif Foreground");
      if (event.data.isNotEmpty) {
        dataBrd.sink.add("Data Waktu Foreground");
      }

      if (event.notification != null) {
        titleBrd.sink.add(event.notification!.title!);
        bodyBrd.sink.add(event.notification!.body!);
      }
      Get.snackbar("Notif", "Ada yang baru nih");
    });
  }

  backgroundNotif() {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("Ini Notif Background");
      if (event.data.isNotEmpty) {
        dataBrd.sink.add("event.data");
      }

      if (event.notification != null) {
        titleBrd.sink.add(event.notification!.title!);
        bodyBrd.sink.add(event.notification!.body!);
      }
    });
  }

  terminatedNotif() async {
    RemoteMessage? initialM =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialM != null) {
      print("Ini Notif Terminated");
      if (initialM.data.isNotEmpty) {
        dataBrd.sink.add("initialM.data");
      }

      if (initialM.notification != null) {
        titleBrd.sink.add(initialM.notification!.title!);
        bodyBrd.sink.add(initialM.notification!.body!);
      }
    }
  }

  @override
  void dispose() {
    dataBrd.close();
    titleBrd.close();
    bodyBrd.close();
  }
}
