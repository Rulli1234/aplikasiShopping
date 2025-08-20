import 'package:flutter/material.dart';
import 'package:shopping_app/model/model_shopping.dart';
import 'package:shopping_app/sqflite/db_helper.dart';

class AddShoppingPage extends StatefulWidget {
  const AddShoppingPage({super.key});

  @override
  State<AddShoppingPage> createState() => _AddShoppingPageState();
}

class _AddShoppingPageState extends State<AddShoppingPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _catatanController = TextEditingController();

  String? _kategori;
  final List<String> kategoriList = [
    "Makanan",
    "Minuman",
    "Elektronik",
    "Pakaian",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Belanja")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: "Nama Barang"),
                validator: (value) =>
                    value!.isEmpty ? "Harap isi nama barang" : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _kategori,
                decoration: const InputDecoration(labelText: "Kategori"),
                items: kategoriList
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) => setState(() => _kategori = value),
                validator: (value) => value == null ? "Pilih kategori" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _catatanController,
                decoration: const InputDecoration(labelText: "Catatan"),
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newItem = ShoppingItem(
                      nama: _namaController.text,
                      kategori: _kategori!,
                      catatan: _catatanController.text,
                    );
                    await DbHelper.insertShoppingItem(newItem);
                    Navigator.pop(context, newItem);
                  }
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
