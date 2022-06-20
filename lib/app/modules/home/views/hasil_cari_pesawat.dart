import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CariPesawatt extends StatefulWidget {
  CariPesawatt({
    Key? key,
    required this.name,
    required this.trips,
    required this.airplane,
  }) : super(key: key);

  final String name;
  final String trips;
  final String airplane;

  @override
  State<CariPesawatt> createState() => _CariPesawattState();
}

class _CariPesawattState extends State<CariPesawatt> {
  String hasilResponseN = "Data Belum Di Load";

  String hasilResponseT = "Data Belum Di Load";

  String hasilResponseA = "Data Belum Di Load";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Data"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ElevatedButton(
            onPressed: () async {
              var response = await http.post(
                  Uri.parse("https://api.instantwebtools.net/v1/passenger"),
                  body: {
                    "name": widget.name,
                    "trips": widget.trips,
                    "airline": widget.airplane,
                  });

              Map<String, dynamic> data =
                  json.decode(response.body) as Map<String, dynamic>;

              setState(() {
                hasilResponseN = "${data['name']}";
                hasilResponseT = "${data['trips']}";
                hasilResponseA = "${data['airline']}";
              });
            },
            child: Text("Show Data"),
          ),
          SizedBox(height: 50),
          Divider(
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Text(
            "Nama : $hasilResponseN",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Text(
            "Trips : $hasilResponseT",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Text(
            "Airplane : $hasilResponseA",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
