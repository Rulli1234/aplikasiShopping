import 'package:flutter/material.dart';
import 'package:shopping_app/model/model_shopping.dart';
import 'package:shopping_app/sqflite/db_helper.dart';
import 'package:shopping_app/view/main/home/add_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShoppingItem> items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final data = await DbHelper.getAllShoppingItem();
    setState(() {
      items = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Belanja")),
      body: items.isEmpty
          ? const Center(child: Text("Belum ada data"))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(item.nama),
                    subtitle: Text(
                      "Kategori: ${item.kategori}\nCatatan: ${item.catatan}",
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddShoppingPage()),
          );

          if (result != null && result is ShoppingItem) {
            _loadItems();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
