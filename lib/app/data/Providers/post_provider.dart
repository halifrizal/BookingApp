import 'dart:convert';

import 'package:bookingapp/app/data/models/airplane.dart';
import 'package:bookingapp/app/modules/home/views/pesawat_detail.dart';
import 'package:bookingapp/app/routes/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostProvider with ChangeNotifier {
  static const String url = "https://apismodul.herokuapp.com/pesawat/";

  void dioCoba(
    String nama,
    String keunggulan,
    String gambar,
    String harga,
  ) async {
    List<AirPlane> data = [];
    var dio = Dio();

    dio.post(
      url,
      data: jsonEncode({
        "namaPesawat": nama,
        "keunggulan": keunggulan,
        "gambar": gambar,
        "harga": harga,
      }),
    );

    notifyListeners();
  }

  Future post(
    String nama,
    String keunggulan,
    String gambar,
    String harga,
  ) async {
    var dio = Dio();

    try {
      final result = await dio.post(
        url,
        data: jsonEncode({
          "namaPesawat": nama,
          "keunggulan": keunggulan,
          "gambar": gambar,
          "harga": harga,
        }),
      );
      Get.snackbar("Berhasil", "Berhasil Create Data");
      Get.offAllNamed(Routes.HOME);
      return result.data;
    } catch (e) {
      print(e);
      Get.snackbar("Gagal", "Gagal Create Data, Error = ${e}");
    }
  }

  Future delete(String id) async {
    var dio = Dio();

    try {
      final result = await dio.delete(
        "${url}/${id}",
      );
      Get.snackbar("Berhasil", "Berhasil Hapus Data");
      Get.offAllNamed(Routes.HOME);
      return result.data;
    } catch (e) {
      print(e);
      Get.snackbar("Gagal", "Gagal Hapus Data, Error = ${e}");
    }
  }

  Future path(
    String nama,
    String keunggulan,
    String gambar,
    String harga,
    String id,
  ) async {
    var dio = Dio();

    try {
      final result = await dio.patch(
        "${url}/${id}",
        data: jsonEncode({
          "namaPesawat": nama,
          "keunggulan": keunggulan,
          "gambar": gambar,
          "harga": harga,
        }),
      );
      Get.snackbar("Berhasil", "Berhasil Update Data");
      Get.offAllNamed(Routes.HOME);
      return result.data;
    } catch (e) {
      print(e);
      Get.snackbar("Gagal", "Gagal Update Data, Error = ${e}");
    }
  }
}
