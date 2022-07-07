// To parse this JSON data, do
//
//     final airPlane = airPlaneFromJson(jsonString);

// Link = https://apismodul.herokuapp.com/pesawat

import 'dart:convert';

List<AirPlane> airPlaneFromJson(String str) =>
    List<AirPlane>.from(json.decode(str).map((x) => AirPlane.fromJson(x)));

String airPlaneToJson(List<AirPlane> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AirPlane {
  AirPlane({
    this.namaPesawat,
    this.keunggulan,
    this.gambar,
    this.harga,
    this.id,
  });

  String? namaPesawat;
  String? keunggulan;
  String? gambar;
  String? harga;
  String? id;

  factory AirPlane.fromJson(Map<String, dynamic> json) => AirPlane(
        namaPesawat: json["namaPesawat"],
        keunggulan: json["keunggulan"],
        gambar: json["gambar"],
        harga: json["harga"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "namaPesawat": namaPesawat,
        "keunggulan": keunggulan,
        "gambar": gambar,
        "harga": harga,
        "id": id,
      };
}
