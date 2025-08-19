// import 'package:flutter/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/halamanutama.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const id = "/login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    "Halo!, Selamat Datang 👋",
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

                SizedBox(
                  width: double.infinity,

                  child: Text(
                    "Nama Pengguna",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
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

                InkWell(
                  onTap: () {
                    print("Lupa bang");
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Lupa Password?",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 145, 57, 105),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TAMPILKAN DIALOG BERHASIL
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
                                        builder: (context) => const FirstPage(),
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
                                  Text(
                                    "Silahkan masukkan email/password yang valid",
                                  ),
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
                      "Masuk",
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(
                      text: "Belum punya akun? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Daftar Sekarang",
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

                Lottie.asset(
                  "assets/images/animations/Shopping Cart Loader.json",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
