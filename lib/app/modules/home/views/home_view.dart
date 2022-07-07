import 'package:bookingapp/app/modules/akun/views/dataAkun.dart';
import 'package:bookingapp/app/modules/favorite/views/favorite_view.dart';
import 'package:bookingapp/app/modules/home/views/post_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int menuSekarang = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> menu = [
      const HomePagee(),
      FavoriteView(),
      AkunPage(),
      PostProviderPage()
    ];

    return Scaffold(
      body: menu[menuSekarang],
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.list, title: 'Favorit'),
          TabItem(icon: Icons.people_sharp, title: 'Akun'),
          TabItem(icon: Icons.people_sharp, title: 'Post'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) {
          setState(() {
            menuSekarang = i;
          });
        },
      ),
    );
  }
}
