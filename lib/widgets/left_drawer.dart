import 'package:flutter/material.dart';
import 'package:coffeeine/screens/menu.dart';
import 'package:coffeeine/screens/coffee_form.dart';
import 'package:coffeeine/screens/show_coffee.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Text(
                  'Coffeeine',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Need caffeine? Time for Coffeeine!",
                    style: TextStyle(
                      
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal
                    ),
                    textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Lihat Kopi'),
            // Bagian redirection ke ShowCoffeePage
            onTap: () {
              Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const ShowCoffeePage(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke CoffeeFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => const CoffeeFormPage(),
              ));
            },
          ),
        ],
      ),
    );
  }
}