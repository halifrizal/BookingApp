import 'package:bookingapp/app/data/Providers/wishlist_provider.dart';
import 'package:bookingapp/app/modules/favorite/views/wishlist_card.dart';
import 'package:bookingapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlist = Provider.of<WishlistProvider>(context);

    Widget kosong() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon/icon_love.png",
                color: Colors.blue,
                width: 90,
              ),
              const SizedBox(
                height: 27,
              ),
              const Text(
                'Data Favorit Masih Kosong',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                'Yuk Tambahkan Tempat Favorit',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.HOME);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 24),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Tambahkan Sekarang',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget adaIsi() {
      return Expanded(
        child: Container(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            children: wishlist.wishlist
                .map(
                  (produk) => WishlistCard(produk),
                )
                .toList(),
          ),
        ),
      );
    }

    Widget atas() {
      return AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Favourite Places',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    return Column(
      children: [
        atas(),
        wishlist.wishlist.isEmpty ? kosong() : adaIsi(),
      ],
    );
  }
}
