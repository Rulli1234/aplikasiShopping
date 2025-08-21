import 'package:flutter/material.dart';
import 'package:shopping_app/view/main/bar_navigasi.dart';
import 'package:shopping_app/view/main/home/add_list.dart';
import 'package:shopping_app/view/main/home/home.dart';
import 'package:shopping_app/view/register.dart';
// ⬅️ Tambahkan juga jika belum

// RouteObserver global
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      navigatorObservers: [routeObserver], // ⬅️ Tambahkan ini agar RouteAware bekerja
      home: HomePage(),
      routes: {
        '/tambah': (context) => const AddShoppingPage(), // ⬅️ Tambahkan route ke halaman tambah
      },
    );
  }
}
