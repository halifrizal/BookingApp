// To parse this JSON data, do
//
//     final airPlane = airPlaneFromJson(jsonString);

// Link = https://airplaneapisnodejs.herokuapp.com/dataPesawat

import 'dart:convert';

List<AirPlane> airPlaneFromJson(String str) =>
    List<AirPlane>.from(json.decode(str).map((x) => AirPlane.fromJson(x)));

String airPlaneToJson(List<AirPlane> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AirPlane {
  AirPlane({
    this.id,
    this.namaPesawat,
    this.keunggulan,
    this.gambar,
    this.harga,
  });

  int? id;
  String? namaPesawat;
  String? keunggulan;
  String? gambar;
  int? harga;

  factory AirPlane.fromJson(Map<String, dynamic> json) => AirPlane(
        id: json["id"],
        namaPesawat: json["namaPesawat"],
        keunggulan: json["keunggulan"],
        gambar: json["gambar"],
        harga: json["harga"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namaPesawat": namaPesawat,
        "keunggulan": keunggulan,
        "gambar": gambar,
        "harga": harga,
      };
}
