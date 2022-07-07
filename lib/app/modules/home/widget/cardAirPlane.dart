import 'package:bookingapp/app/data/Providers/post_provider.dart';
import 'package:bookingapp/app/data/Providers/wishlist_provider.dart';
import 'package:bookingapp/app/data/models/airplane.dart';
import 'package:bookingapp/app/modules/home/views/pesawat_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CardViewAirPlane extends StatelessWidget {
  final AirPlane airPlane;

  CardViewAirPlane(this.airPlane);
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PostProvider post = Provider.of<PostProvider>(context);

    return GestureDetector(
      onTap: () {
        Get.to(DetailPesawat(airPlane));
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(1, 1))
                ],
              ),
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
                              image: NetworkImage("${airPlane.gambar}"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          "${airPlane.namaPesawat}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          "${airPlane.keunggulan}",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 5, right: 5, top: 20),
                        child: Text(
                          "Rp. ${airPlane.harga}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Tambah Ke Favorit",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
