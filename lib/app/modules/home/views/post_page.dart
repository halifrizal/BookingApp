import 'package:bookingapp/app/data/Providers/post_provider.dart';
import 'package:bookingapp/app/data/models/airplane.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PostProviderPage extends StatelessWidget {
  PostProvider post = PostProvider();
  AirPlane? result = null;
  @override
  Widget build(BuildContext context) {
    PostProvider post = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("POST - PROVIDER"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () async {
                post.post(
                  "Batik Air",
                  "Deskripsi Batik 5",
                  "https://asset.kompas.com/crops/1pEScSZI5bMznUAgZ1Hyl65870Q=/0x0:1280x853/750x500/data/photo/2020/06/04/5ed8b1b29edcd.jpeg",
                  "980000",
                );
              },
              child: const Text(
                "POST DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () async {
                post.path(
                  "City Link",
                  "Deskripsi Baru",
                  "https://asset.kompas.com/crops/1pEScSZI5bMznUAgZ1Hyl65870Q=/0x0:1280x853/750x500/data/photo/2020/06/04/5ed8b1b29edcd.jpeg",
                  "980000",
                  "451a04e0-7bd6-4586-8882-7c9d9fdb27b8",
                );
              },
              child: const Text(
                "PATCH DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
