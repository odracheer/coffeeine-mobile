<p align="center">
  <img src="https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/05/20/2240932928.jpg" height="300" width="300" alt="BookBuffet Logo"/>
</p>
<h1 align="center">
  <em><strong>Coffeeine</strong></em>
</h1>
<p align="center">
  <em>--- Need caffeine? Time for Coffeeine ☕ ---</em>
</p>
<p align="center">
    <em>Link to Coffeeine is to be announced!</em>
</p>
<h1 align="center">
    <em><strong>This web is made with a big passion and a little caffeeine by </br>
                Ricardo Palungguk Natama - 2206082700 - PBP C</strong></em>
</h1>

<details>
<summary>Tugas 7 PBP</summary>

# Tugas 7 PBP
## Soal :
1. Apa perbedaan utama antara _stateless_ dan _stateful widget_ dalam konteks pengembangan aplikasi Flutter?
2. Sebutkan seluruh _widget_ yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara _step-by-step_ (bukan hanya sekadar mengikuti tutorial)

## Jawaban :
1. Mengutip dari GeeksForGeeks, ada beberapa perbedaan utama antara _stateless_ dan _stateful_ widget dalam konteks pengembangan aplikasi Flutter. Perbedaan tersebut akan saya jabarkan dalam bentuk tabel:

    | Karakteristik             | Stateless Widget                                      | Stateful Widget                                              |
    |---------------------------|-------------------------------------------------------|--------------------------------------------------------------|
    | Sifat Widget              | _Static_                                              | _Dynamic_                                                    |
    | Bergantung pada Data      | Tidak bergantung pada perubahan data atau perilaku    | Dapat diperbarui selama _runtime_ berdasarkan tindakan pengguna atau perubahan data                                                                                                                                |
    | Keadaan Internal          | Tidak memiliki keadaan internal (_state_)             | Memiliki keadaan internal (_state_) yang dapat berubah       |
    | Perbarui Dirinya Sendiri  | Tidak akan perbarui dirinya sendiri, hanya ketika data eksternal berubah | Dapat me-_render_ ulang dirinya sendiri jika data input berubah atau jika keadaan widget berubah                                                                                                |
    | Contoh Widget             | Text, Icon, RaisedButton                              | Checkbox, Radio Button, Slider                               |


<br>

2. Berikut adalah daftar _widget_ yang saya gunakan untuk menyelesaikan tugas ini:
    * `main.dart`
      * `MyApp`: _Widget_ utama aplikasi yang menjalankan aplikasi Flutter.
      * `MaterialApp`: _Widget_ ini menentukan akar dari aplikasi Flutter yang menggunakan _material design_, termasuk judul dan tema aplikasi.
      * `ThemeData`: _Widget_ yang mengatur tema umum aplikasi, termasuk warna, tipografi, dan properti visual lainnya.
      * `MyHomePage`: _Widget_ yang berfungsi sebagai halaman utama aplikasi yang menampilkan elemen UI.
      * `ColorScheme.fromSeed`: _Widget_ yang digunakan untuk menghasilkan skema warna.

    * `menu.dart`
      * `MyHomePage`: _Widget_ utama halaman utama yang bertanggung jawab untuk menampilkan elemen UI.
      * `Scaffold`: _Widget_ yang menyediakan struktur dasar untuk halaman, termasuk _app bar_ dan konten.
      * `AppBar`: _Widget_ yang mewakili _app bar_ di bagian atas layar.
      * `SingleChildScrollView`: _Widget_ yang mengelilingi konten dan memungkinkan _scroll_ jika konten melebihi tinggi layar.
      * `Padding`: _Widget_ yang mampu menambahkan _padding_ pada _child widget_, menciptakan jarak dalam konten.
      * `Column`: _Widget_ yang mengatur _child widget_ secara vertikal secara linear.
      * `Text`: _Widget_ untuk menampilkan teks dengan gaya tertentu.
      * `GridView.count`:_ Widget_ untuk mengatur _child widget_ dalam tata letak grid dengan properti tertentu.
      * `ShopCard`: _Widget_ khusus untuk menampilkan item toko individual dalam grid.
      * `Material`: _Widget_ yang memberikan warna latar belakang dan elevasi terhadap _child widget_.
      * `InkWell`: _Widget_ yang membuat _child widget_ merespons peristiwa sentuhan.
      * `SnackBar`: _Widget_ yang menampilkan pesan sementara di bagian bawah layar sebagai respons terhadap sentuhan.
      * `Container`: _Widget_ yang digunakan untuk memuat _widget_ lain dan menerapkan _padding_.
      * `Icon`: _Widget_ untuk menampilkan ikon.
      * `Center`: _Widget_ yang mengatur posisi _child widget_ ke tengah secara horizontal dan vertikal.

<br>

3. Untuk mengimplementasikan _checklist_ di atas secara _step-by-step_, saya akan menjabarkan setiap poin satu per satu.
    * **Membuat sebuah program Flutter baru dengan tema _inventory_ seperti tugas-tugas sebelumnya.**<br>
      Pertama-tama, saya melakukan instalasi Flutter terlebih dahulu. Setelah itu, saya membuka `Command Prompt` dan menjalankan perintah berikut:<br>
      ```
      flutter create coffeeine

      cd coffeeine

      flutter run
      ```
      Setelah melakukan perintah tersebut, kode yang menjadi _base_ program kita otomatis terbuat dan kita bisa membuatnya sesuai dengan keinginan kita.

    * **Membuat tiga tombol sederhana dengan ikon dan teks untuk: Melihat daftar item (`Lihat Item`), Menambah item (`Tambah Item`), dan Logout (`Logout`).**<br>
      Pertama-tama, saya membuka direktori `lib` dan membuat _file_ baru dengan nama `menu.dart`. Setelah itu, saya menambahkan kode `import 'package:flutter/material.dart'` untuk mengimpor _material design_. Lalu, saya memindahkan _class_ `MyHomePage` dari `main.dart` ke `menu.dart`. _Class_ ini akan berfungsi sebagai halaman utama aplikasi yang menampilkan elemen UI. Selanjutnya, saya menghapus _class_ `_MyHomePageState` karena _widget_ yang akan dibuat adalah _widget stateless_. Setelah selesai melakukan semua langkah tersebut, saya membuat _class_ `ShopItem` dan `ShopCard` untuk membuat tiga tombol tersebut beserta masing-masing `SnackBar` ketika tombol diklik. Berikut adalah kodenya:<br>
      ```
      class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
          return Material(
            color: item.color,
            child: InkWell(
              // Area responsive terhadap sentuhan
              onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      content: Text("Kamu telah menekan tombol ${item.name}")));
              },
              child: Container(
                // Container untuk menyimpan Icon dan Text
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      const Padding(padding: EdgeInsets.all(3)),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }

      class ShopItem {
          final String name;
          final IconData icon;
          final Color color;

          ShopItem(this.name, this.icon, this.color);
      }
      ```
      Setelah itu, saya memodifikasi `MyHomePage` agar bisa menampilkan tiga tombol. Berikut hasil modifikasinya:<br>
      ```
      class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        final List<ShopItem> items = [
            ShopItem("Lihat Item", Icons.checklist, const Color.fromRGBO(188, 117, 10, 1)),
            ShopItem("Tambah Item", Icons.add_shopping_cart, const Color.fromARGB(255, 250, 151, 4)),
            ShopItem("Logout", Icons.logout, const Color.fromARGB(255, 250, 201, 4)),
        ];

        @override
        Widget build(BuildContext context) {
          return Scaffold(

            appBar: AppBar(
              title: const Text(
                'Coffeeine',
              ),
            ),

            body: SingleChildScrollView(
              // Widget wrapper yang dapat discroll
              child: Padding(
                padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                child: Column(
                  // Widget untuk menampilkan children secara vertikal
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                      child: Text(
                        'Coffeeine', // Text yang menandakan judul
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Grid layout
                    GridView.count(
                      // Container pada card kita.
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items.map((ShopItem item) {
                        // Iterasi untuk setiap item
                        return ShopCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }
      ```
      Setelah melakukan semua langkah tersebut, terciptalah tampilan _website_ dengan ikon, teks, dan tiga tombol sederhana.

    * **Memunculkan `SnackBar` dengan tulisan: "Kamu telah menekan tombol Lihat Item" ketika tombol `Lihat Item` ditekan, "Kamu telah menekan tombol Tambah Item" ketika tombol `Tambah Item` ditekan, dan "Kamu telah menekan tombol Logout" ketika tombol `Logout` ditekan.**<br>
      Untuk memunculkan `Snackbar`, saya menambahkan _widget_ `InkWell` yang dapat menampilkan ikon dan teks pada saat `item` ditekan di bagian . Tombol ini akan menampilkan `SnackBar` dengan tulisan `Kamu telah menekan tombol [nama item]`. Berikut adalah kode yang ditambahkan:<br>
      ```
      class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
          return Material(

            color: item.color,
            
            child: InkWell(
              // Area responsive terhadap sentuhan
              onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      content: Text("Kamu telah menekan tombol ${item.name}")));
              },
              child: Container(
                // Container untuk menyimpan Icon dan Text
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      const Padding(padding: EdgeInsets.all(3)),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }
      ```

<br>

## Bonus Tugas 7
Saya telah menambahkan warna-warna yang berbeda untuk setiap tombol `Lihat Item`, `Tambah Item`, dan `Logout`. Modifikasi yang dilakukan ada di bagian _class_ `ShopItem` di mana saya menambahkan atribut dan _constructor_ `color` serta memodifikasi _class_ `ShopCard` dengan menambahkan `color: item.color` di bagian _method_ `build()`.

## Referensi Tugas 7
* Jain, S. (2021, August 5). _Difference Between Stateless and Stateful Widget in Flutter_. GeeksforGeeks. Retrieved November 8, 2023, from https://www.geeksforgeeks.org/difference-between-stateless-and-stateful-widget-in-flutter/

</details>

<details>

<summary>Tugas 8 PBP</summary>

# Tugas 8 PBP
## Soal :
1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
2. Jelaskan masing-masing _layout_ widget pada Flutter dan konteks penggunaannya masing-masing!
3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
4. Bagaimana penerapan _clean architecture_ pada aplikasi Flutter?
5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara _step-by-step_ (bukan hanya sekadar mengikuti tutorial)

## Jawaban :
1. 

## Referensi Tugas 8

</details>