import 'package:bookingapp/app/data/Providers/produk_provider.dart';
import 'package:bookingapp/app/data/models/airplane.dart';
import 'package:bookingapp/app/data/models/produk.dart';
import 'package:bookingapp/app/modules/home/views/hotel.dart';
import 'package:bookingapp/app/modules/home/widget/cardAirPlane.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';

import '../widget/card.dart';
import '../widget/fungsiSearch.dart';
import 'pesawat.dart';
import '../widget/projectkategori.dart';

class HomePagee extends StatefulWidget {
  const HomePagee({Key? key}) : super(key: key);

  @override
  State<HomePagee> createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  final homeC = Get.put(HomeController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    var produkProvider = Provider.of<ProdukProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0266FF),
        automaticallyImplyLeading: false,
        title: TextButton(
          onPressed: () {},
          child: const Text(
            "Tiket.com",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: iniSearch());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: [
          //Banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Image.asset("assets/baner/baner2.png"),
          ),
          //Pemisah Lurus
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Image.asset(
              "assets/logo/lurus.png",
              height: 25,
              width: 20,
            ),
          ),
          //Icon 1
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(CardPesawat());
                      },
                      child: const ProjectKategori(
                        title: "Pesawat",
                        icon: "airplane",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(CardHotel());
                      },
                      child: const ProjectKategori(
                        title: "Hotel",
                        icon: "hotel",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(CardPesawat());
                      },
                      child: const ProjectKategori(
                        title: "Kereta Api",
                        icon: "train",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(CardPesawat());
                      },
                      child: const ProjectKategori(
                        title: "Villa",
                        icon: "villa",
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 20),
          const Divider(
            color: Color(0xFF0266FF),
            indent: 10,
            endIndent: 10,
            thickness: 0.2,
          ),
          //Content 1 Text
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "PROMO TIKET HOTEL!",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                  Wrap(
                    children: const [
                      Text(
                        "Buruan nginap di Hotel impian, karena tiket.com sedang ada promo Hotel yang menarik nih",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              )),
          //Content 1 Gambar
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: FutureBuilder(
              future: produkProvider.getRecommendedSpaces(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Produk> data = snapshot.data as List<Produk>;

                  int index = 0;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: data.map((item) {
                        index++;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CardView(
                                item,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xFF0266FF),
            indent: 10,
            endIndent: 10,
            thickness: 0.2,
          ),
          //Content 2 Text
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Staycation aman, puasa lancar",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    children: const [
                      Text(
                        "Yuk,nginep di hotel yang nyediain makanan sahur dan buka puasa",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              )),
          //Content 2 Gambar
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<List<AirPlane>>(
                  future: homeC.ambilSemuaData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("Tidak Ada Data"),
                      );
                    }
                    List<AirPlane> data = snapshot.data as List<AirPlane>;

                    int index = 0;

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: data.map((item) {
                          index++;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CardViewAirPlane(
                                  item,
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }),
              // child: Row(
              //   children: const [
              // CardView(
              //   judulP: "Sahid Raya Hotel & Convention Yogyakarta",
              //   textP: "Depok, Yogyakarta",
              //   harga: "332.529",
              //   hargaA: "389.000",
              //   gambarP: "assets/produkH/sahit.jpg",
              // ),
              // CardView(
              //   judulP: "Aloft Bali Kuta ai Beachwalk",
              //   textP: "Kuta, Badung",
              //   harga: "786.016",
              //   hargaA: "986.000",
              //   gambarP: "assets/produkH/aloft.jfif",
              // ),
              // CardView(
              //   judulP: "The Papandayan",
              //   textP: "Lengkong, Bandung",
              //   harga: "1.028.500",
              //   hargaA: "833.085",
              //   gambarP: "assets/produkH/papandayan.webp",
              // ),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
