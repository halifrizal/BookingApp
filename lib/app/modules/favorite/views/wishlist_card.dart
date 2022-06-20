import 'package:bookingapp/app/data/Providers/wishlist_provider.dart';
import 'package:bookingapp/app/data/models/produk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  final Produk produk;
  WishlistCard(this.produk);
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "${produk.imageUrl}",
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${produk.name}",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(
                  "${produk.price}",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduk(produk);
            },
            child: Image.asset(
              "assets/icon/icon_love.png",
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
