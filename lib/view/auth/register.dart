// import 'package:flutter/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/model/model_pengguna.dart';
import 'package:shopping_app/sqflite/db_helper.dart';
import 'package:shopping_app/view/main/bar_navigasi.dart';

class DaftarAkun extends StatefulWidget {
  const DaftarAkun({super.key});
  static const id = "/login";

  @override
  State<DaftarAkun> createState() => _DaftarAkunState();
}

class _DaftarAkunState extends State<DaftarAkun> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordHidden = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Text(
                    "Halo!, Selamat Daftar 👋",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: Text(
                    "Masuk sekarang dan catat semua kebutuhanmu dengan mudah",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                    textAlign: TextAlign.left,
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(width: double.infinity, child: Text("Nama Pengguna")),
                SizedBox(height: 10),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,

                  child: Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email Tidak Valid";
                    }
                    if (!value.contains("@")) {
                      return "Email tidak valid";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: passwordController,
                  obscureText: _isPasswordHidden,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,

                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromARGB(255, 247, 230, 242),
                      ),
                    ),

                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        // TAMPILKAN DIALOG BERHASIL
                        final penggunaBaru = Pengguna(
                          username: usernameController.text, 
                          email: emailController.text, 
                          password: passwordController.text);

                          await DbHelper.insertPengguna(penggunaBaru);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Berhasil"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 50),
                                  Lottie.asset(
                                    "assets/images/animations/successgraduation.json",
                                    width: 90,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MainScreen(),
                                      ),
                                    );
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // TAMPILKAN DIALOG GAGAL
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("GAGAL"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Silahkan masukkan email/password"),
                                  SizedBox(height: 20),
                                  Lottie.asset(
                                    "assets/images/animations/Fail.json",
                                    width: 90,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },

                    child: Text(
                      "Daftar",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 2, 2, 2),
                      ),
                    ),
                  ),
                ),

                // Lottie.asset(
                //   "assets/images/animations/Shopping Cart Loader.json",
                // ),
                // Text.rich(
                //   TextSpan(
                //     text: "Don't have an acoount? ",
                //     style: TextStyle(color: Colors.black),
                //     children: [
                //       TextSpan(
                //         text: "Sign up",
                //         style: TextStyle(
                //           color: Colors.deepOrange,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         recognizer: TapGestureRecognizer()
                //           ..onTap = () {
                //             print("Sign up");
                //           },
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 10),
                // Row(
                //   children: [
                //     Expanded(child: Divider()),
                //     SizedBox(width: 8),
                //     Text("Or Sign In With"),
                //     SizedBox(width: 8),
                //     Expanded(child: Divider()),
                //   ],
                // ),

                // Row(
                //   children: [
                //     Expanded(
                //       child: ElevatedButton.icon(
                //         style: ButtonStyle(elevation: WidgetStatePropertyAll(0)),
                //         onPressed: () {},
                //         icon: Image.asset(
                //           'assets/images/google.jpg',
                //           height: 30,
                //           width: 24,
                //         ),
                //         label: Text("google"),
                //       ),
                //     ),
                //     SizedBox(width: 20),
                //     Expanded(
                //       child: ElevatedButton.icon(
                //         style: ButtonStyle(elevation: WidgetStatePropertyAll(0)),
                //         onPressed: () {},
                //         icon: Image.asset(
                //           'assets/images/fesbuk.png',
                //           height: 30,
                //           width: 24,
                //         ),
                //         label: Text("Facebook"),
                //       ),
                //     ),
                //   ],
                // ),

                SizedBox(height: 10),

ElevatedButton(
  style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.amber),
  ),
  onPressed: () async {
    final db = await DbHelper.databaseHelper();
    final List<Map<String, dynamic>> result = await db.query('daftar');
    print("🔥 DEBUG - DATA DI TABEL:");
    for (var row in result) {
      print(row);
    }
  },
  child: Text("🔍 Debug: Cek Isi DB"),
),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(
                      text: "Sudah punya akun? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Masuk Sekarang",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 145, 57, 105),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("Join Us");
                            },
                        ),
                      ],
                    ),
                  ),
                ),

                // Lottie.asset(
                //   "assets/images/animations/Shopping Cart Loader.json",
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
