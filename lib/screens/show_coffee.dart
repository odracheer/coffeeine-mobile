import 'package:flutter/material.dart';
import 'package:coffeeine/widgets/left_drawer.dart';
import 'package:coffeeine/widgets/globals.dart' as globals;

class ShowCoffeePage extends StatefulWidget {
  const ShowCoffeePage({super.key});

  @override
  State<ShowCoffeePage> createState() => _ShowCoffeeState();
}

class _ShowCoffeeState extends State<ShowCoffeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Your Favorite Coffeeine(s)'),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Center(
          child: ListView.builder(
            itemCount: globals.coffeeList.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(5.0),
                    shadowColor: Colors.blueGrey,
                    child: ListTile(
                      title: Text("Nama: ${globals.coffeeList[index].name}"),
                      subtitle: Text("Deskripsi: ${globals.coffeeList[index].description}"),
                      trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Harga: ${globals.coffeeList[index].price}"),
                            Text("Jumlah: ${globals.coffeeList[index].amount}"),
                          ]
                      ),
                    )
                ),
              );
            }),
          )
      ),
    );
  }
}