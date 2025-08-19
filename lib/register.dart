import 'package:flutter/material.dart';
import 'package:shopping_app/daftar.dart';
import 'package:shopping_app/db_helper.dart';

class RegisterPengguna extends StatefulWidget {
  const RegisterPengguna({super.key});

  @override
  State<RegisterPengguna> createState() => _RegisterPenggunaState();
}

class _RegisterPenggunaState extends State<RegisterPengguna> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;

  List<Pengguna> daftarPengguna = [];

  @override
  void initState() {
    super.initState();
    muatData();
  }

  Future<void> muatData() async {
    final data = await DbHelper.getAllPengguna();
    setState(() {
      daftarPengguna = data;
    });
  }

  Future<void> simpanData() async {
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      await DbHelper.insertPengguna(
        Pengguna(username: username, email: email, password: password),
      );

      usernameController.clear();
      emailController.clear();
      passwordController.clear();
      muatData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftarrrrrr")),
      body: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(labelText: "Nama"),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: "Password"),
          ),

          SizedBox(height: 20),
          ElevatedButton(onPressed: simpanData, child: Text("Simpan")),
        ],
      ),
    );
  }
}
