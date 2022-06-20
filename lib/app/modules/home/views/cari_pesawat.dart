import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hasil_cari_pesawat.dart';

class CariPesawat extends StatefulWidget {
  const CariPesawat({Key? key}) : super(key: key);

  @override
  State<CariPesawat> createState() => _CariPesawatState();
}

class _CariPesawatState extends State<CariPesawat> {
  TextEditingController nameC = TextEditingController();
  TextEditingController tripC = TextEditingController();
  TextEditingController airC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Data"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: tripC,
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: "Trips",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: airC,
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: "Airlane",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Get.to(CariPesawatt(
                name: nameC.text,
                trips: tripC.text,
                airplane: airC.text,
              ));
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
