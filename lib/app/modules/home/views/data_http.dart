import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/summary.dart';
import 'package:http/http.dart' as osas;

class DataHttp extends StatelessWidget {
  late Summary ambilSummary;

  Future getData() async {
    var response = await osas.get(
      Uri.parse("https://covid19.mathdro.id/api"),
    );
    Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    ambilSummary = Summary.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Covid19"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, s) {
          if (s.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Sedang Mengambil Data...."),
            );
          }
          return Column(
            children: [
              DataSummary("Kasus Covid", "${ambilSummary.confirmed.value}"),
              DataSummary("Data Kematian", "${ambilSummary.deaths.value}"),
            ],
          );
        },
      ),
    );
  }
}

class DataSummary extends StatelessWidget {
  DataSummary(this.title, this.value);

  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: EdgeInsets.all(20),
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}
