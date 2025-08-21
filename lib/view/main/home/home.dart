import 'package:flutter/material.dart';
import 'package:shopping_app/model/model_shopping.dart';
import 'package:shopping_app/sqflite/db_helper.dart';

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

  final _namaController = TextEditingController();
  final _catatanController = TextEditingController();
  final _kategoriController = TextEditingController();
  String? _kategori;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Belanja")),
      body: items.isEmpty
          ? const Center(child: Text("Belum ada data"))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(item.nama),
                    subtitle: Text(
                      "Kategori: ${item.kategori}\nCatatan: ${item.catatan}",
                    ),
                    trailing: Row(
                      children: [
                        IconButton(onPressed: (){
                          showDialog(context: context, 
                          builder: (context) => AlertDialog(
                            title: Text('Edit Data'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: _namaController
                                  ..text = item.nama,
        
                                ),

                                SizedBox(height: 12,),
                                // DropdownButtonFormField(
                                //   value: _kategori,
                                //   decoration: InputDecoration(
                                //     labelText: 'kategori',
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(25)
                                //     )
                                //   ),
                        
                                      
                                //   items: kategoriList.map((String value){
                                //     return DropdownMenuItem<String>(
                                //       value: value,
                                //       child: Text(value),
                                //     );
                                //   }).toList()
                                //   onChanged: (String? newValue){
                                //     setState(() {
                                //       _kategori = newValue;
                                //       _kategoriController.text = newValue ??'';
                                //     });
                                //   },
                                //   ),
                                TextFormField(
                              controller: _kategoriController,
                              readOnly: true,
                              decoration: InputDecoration(
                              labelText: 'Kategori Terpilih',
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              ),
                                SizedBox(height: 12,),
                                TextFormField(
                                controller: _catatanController
                                ..text = item.catatan,
                                )
                                
                              ],
                            ),
                            actions: [
                              ElevatedButton(onPressed: (){
                                final newItem = ShoppingItem(
                                nama: _namaController.text,
                                kategori: _kategori!,
                                catatan: _catatanController.text,
                                );
                                DbHelper.updateShoppingItem(newItem);
                                _loadItems();
                                Navigator.pop(context, newItem);
                                
                                
                              }, 
                              child: Text('simpan'),
                              ),
                              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("batal"),
                              )
                            ],
                          )
                        );
                        }, icon: Icon(Icons.edit)),

                        IconButton(onPressed: (){
                          DbHelper.deleteShoppingItem(item.id!);
                          _loadItems();
                        }, icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              },
            ),

    );
  }
}
