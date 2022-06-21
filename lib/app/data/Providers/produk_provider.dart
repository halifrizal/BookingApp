import 'dart:convert';

import 'package:bookingapp/app/data/models/produk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProdukProvider extends ChangeNotifier {
  getRecommendedSHotel() async {
    var result = await http.get(
      Uri.parse('https://airplaneapisnodejs.herokuapp.com/dataHotel'),
    );

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Produk> produks = data.map((item) => Produk.fromJson(item)).toList();
      return produks;
    } else {
      return <Produk>[];
    }
  }
}
