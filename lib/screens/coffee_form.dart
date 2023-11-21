import 'dart:convert';

import 'package:coffeeine/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:coffeeine/widgets/left_drawer.dart';
import 'package:coffeeine/widgets/globals.dart' as globals;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class Coffee {
  late String name;
  late int price;
  late int amount;
  late String description;

  Coffee({required this.name, required this.price, required this.amount, required this.description});
}

class CoffeeFormPage extends StatefulWidget {
    const CoffeeFormPage({super.key});

    @override
    State<CoffeeFormPage> createState() => _CoffeeFormPageState();
}

class _CoffeeFormPageState extends State<CoffeeFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    int _amount = 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>(); 
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Add Your Coffee!',
              ),
            ),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nama Item",
                          labelText: "Nama Item",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _name = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Harga",
                          labelText: "Harga",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                          _price = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Harga tidak boleh kosong!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Harga harus berupa angka!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Jumlah",
                          labelText: "Jumlah",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                          _amount = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Jumlah tidak boleh kosong!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Jumlah harus berupa angka!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Deskripsi",
                          labelText: "Deskripsi",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _description = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Deskripsi tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(const Color.fromARGB(255, 250, 151, 4)),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                                // Kirim ke Django dan tunggu respons
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                final response = await request.postJson(
                                "http://127.0.0.1:8000/create-flutter/",
                                jsonEncode(<String, String>{
                                    'name': _name,
                                    'price': _price.toString(),
                                    'amount': _amount.toString(),
                                    'description': _description,
                                }));
                                if (response['status'] == 'success') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                    content: Text("Kopi baru berhasil disimpan!"),
                                    ));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        content:
                                            Text("Terdapat kesalahan, silakan coba lagi."),
                                    ));
                                }
                              _formKey.currentState!.reset();
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ),
          );
    }
}