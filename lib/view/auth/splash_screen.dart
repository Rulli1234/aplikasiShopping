import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const id = 'splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    // bool? isLogin = await PreferenceHandler.getLogin();

    // Future.delayed(Duration(seconds: 5)).then((value) async {
    // //   context.push(Login());
    // // );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/animations/List.json"),
            SizedBox(height: 20),
            Text("Selamat Datang!"),
          ],
        ),
      ),
    );
  }
}
