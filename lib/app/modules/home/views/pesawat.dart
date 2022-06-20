import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widget/card.dart';
import 'cari_pesawat.dart';
import 'data_http.dart';
import 'hasil_cari_pesawat.dart';

//Bagian Pesawat
class CardPesawat extends StatefulWidget {
  @override
  State<CardPesawat> createState() => _CardPesawatState();
}

class _CardPesawatState extends State<CardPesawat> {
  TextEditingController TanggalTerpilih = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController tripC = TextEditingController();
  TextEditingController airC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ini Judul"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://img.idxchannel.com/media/500/images/idx/2019/04/01/pesawat_terbang.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          //Date Picker
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: TanggalTerpilih,
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Masukkan Tanggal Berangkat"),
              readOnly: true,
              onTap: () async {
                DateTime? pilihTanggal = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030));

                if (pilihTanggal != null) {
                  String formattedDate =
                      DateFormat('d-MM-yyyy').format(pilihTanggal);

                  setState(() {
                    TanggalTerpilih.text = formattedDate;
                  });
                } else {
                  print("Data Kosong");
                }
              },
            ),
          ),
          const SizedBox(height: 15),
          //Text Nama
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: nameC,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Text Trips
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: tripC,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Trips",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Text Airplane
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: airC,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Airlane",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Button Cari
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.to(CariPesawatt(
                    name: nameC.text,
                    trips: tripC.text,
                    airplane: airC.text,
                  ));
                },
                child: const Text("Submit"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: Color(0xFF0266FF),
            indent: 10,
            endIndent: 10,
            thickness: 0.2,
          ),
          //Text 1
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Informasi Covid Terbaru",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                  Wrap(
                    children: const [
                      Text(
                        "Sebelum anda terbang bersama kami, yuk cek terlebih dahulu kondisi Covid19 yang terbaru",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              )),
          //Content 1 Gambar
          Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CardCovid(),
                  ],
                ),
              )),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class CardCovid extends StatelessWidget {
  const CardCovid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: 200,
            height: 250,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(1, 1))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16)),
                          image: DecorationImage(
                              image: new NetworkImage(
                                  'https://infeksiemerging.kemkes.go.id/storage/posts/November2021/HwzCH41qx5fwMudRqsLH.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: const Text(
                        "Kondisi Covid19",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: const Text(
                        "Baca sebelum melakukan penerbangan",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 25, right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(DataHttp());
                        },
                        child: Text("Baca Lebih Lanjut"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
