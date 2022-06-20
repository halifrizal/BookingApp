import 'dart:convert';

import 'package:bookingapp/app/data/models/airplane.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Future<List<AirPlane>> ambilSemuaData() async {
    Uri url = Uri.parse("https://airplaneapisnodejs.herokuapp.com/dataPesawat");
    var res = await http.get(url);

    List? data = (json.decode(res.body) as List<dynamic>);

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => AirPlane.fromJson(e)).toList();
    }
  }
}
