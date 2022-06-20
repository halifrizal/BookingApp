import 'package:bookingapp/app/controllers/auth_controller.dart';
import 'package:bookingapp/app/data/Providers/produk_provider.dart';
import 'package:bookingapp/app/data/Providers/wishlist_provider.dart';
import 'package:bookingapp/app/modules/home/views/home_view.dart';
import 'package:bookingapp/app/modules/login/views/login_view.dart';
import 'package:bookingapp/app/widget/tunggu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProdukProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
      ],
      child: StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.data);
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              // initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
              home:
                  snapshot.data != null && snapshot.data!.emailVerified == true
                      ? HomeView()
                      : LoginView(),
              getPages: AppPages.routes,
            );
          } else {
            return Tunggu();
          }
        },
      ),
    );
  }
}
