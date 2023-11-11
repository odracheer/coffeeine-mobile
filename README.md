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
1. `Navigator.push()` dan `Navigator.pushReplacement()` adalah dua metode yang digunakan dalam Flutter untuk navigasi antar halaman. Meskipun mirip, keduanya memiliki perbedaan.
    
    * `Navigator.push()`<br>
      `Navigator.push()` digunakan untuk menambahkan suatu _route_ ke dalam _stack route_ yang dikelola oleh `Navigator`. Dengan kata lain, _route_ yang baru ditambahkan akan berada di posisi paling atas _stack_ sehingga berada di atas _route_ halaman sebelumnya. Setelah itu, halaman yang baru akan ditampilkan dan pengguna dapat kembali ke halaman sebelumnya dengan menekan tombol `Back`. Contoh penggunaannya adalah ketika pengguna ingin melakukan sesuatu di halaman berikut namun masih ingin kembali ke halaman sebelumnya (seperti melihat detail _item_ ke halaman baru pada saat pengguna sedang berada di halaman _list item_), `Navigator.push()` cocok untuk digunakan. Implementasinya dalam tugas ini:
      ```
      if (item.name == "Tambah Item") {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => const CoffeeFormPage(),
        ));
      }
      ```

    * `Navigator.pushReplacement()` <br>
      `Navigator.pushReplacement()` digunakan untuk menghapus _route_ yang sedang ditampilkan ke pengguna dan menggantinya dengan _route_ baru yang akan ditampilkan ke pengguna. Oleh karena itu, _route_ lama yang dikelola `Navigator` di _stack_ akan digantikan secara langsung oleh _route_ baru tanpa mengubah kondisi elemen _stack_ yang berada di bawahnya. Contoh penggunaannya adalah ketika pengguna sudah menyelesaikan tugas pada suatu halaman, maka pengguna langsung berganti ke halaman baru tanpa kembali ke halaman sebelumnya (seperti melakukan _logout_ dari suatu aplikasi). Implementasinya dalam tugas ini:
      ```
      onTap: () {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => const ShowCoffeePage(),
        ));
      },
      ``` 

<br>

2. Di Flutter, _layout_ widget digunakan untuk mengatur tata letak atau susunan antar elemen di dalam widget tree. Berikut adalah beberapa layout widgets utama beserta konteks penggunaannya:

    * `Container`: `Container` adalah _layout_ widget serbaguna yang dapat menahan dan mengatur ukuran, _padding_, dan _margin_. Widget ini dapat digunakan sebagai wadah umum untuk elemen-elemen lainnya.

    * `Row` dan `Column`: `Row` dan `Column` digunakan untuk menyusun widget secara horizontal (`Row`) atau vertikal (`Column`). Kedua widget ini cocok digunakan untuk mengatur elemen secara sejajar.

    * `ListView`: `ListView` digunakan ketika kita memiliki daftar item yang mungkin lebih panjang daripada yang dapat ditampilkan di layar. Widget ini bahkan mendukung _scrolling_ secara otomatis.

    * `GridView`: `GridView` digunakan untuk menampilkan elemen dalam bentuk grid. Ini berguna untuk menampilkan koleksi _item_ dalam susunan baris dan kolom.

    * `Stack`: `Stack` memungkinkan kita untuk menumpuk elemen-elemen di atas satu sama lain. Widget ini cocok digunakan untuk membuat _user interface_ yang kompleks.

    * `Expanded`: `Expanded` digunakan untuk memberikan ukuran tambahan pada _child_ widget dalam `Row`, `Column`, atau `Flex`. Ini memungkinkan _child_ widget mengisi ruang yang tersedia secara proporsional.

    * `SizedBox`: `SizedBox` memungkinkan kita untuk menetapkan lebar, tinggi, atau keduanya pada _child_ widgetnya. Widget ini sering digunakan untuk memberikan jarak atau membatasi ukuran widget.

    * `Wrap`: `Wrap` membantu kita untuk menampilkan daftar _child_ widget secara otomatis mengalir ke baris atau kolom berikutnya jika tidak ada ruang cukup. Widget ini sangat berguna untuk tag atau chip yang jumlahnya dinamis dan perlu dibungkus ke baris selanjutnya.

<br>

3. Pada tugas ini, elemen-elemen input yang saya pakai melibatkan penggunaan `TextFormField` di form. Berikut adalah elemen-elemen input yang terdapat dalam kode saya:

    * **Nama Item (`_name`)**<br>
    `TextFormField` digunakan untuk mengambil input nama item. Lalu, `onChanged` digunakan untuk memperbarui variabel `_name` setiap kali nilai berubah. `validator` memastikan bahwa nilai tidak kosong.

    * **Harga (`_price`)**<br>
    `TextFormField` digunakan untuk mengambil input harga. `onChanged` digunakan untuk memperbarui variabel `_price` setiap kali nilai berubah. `validator` memastikan bahwa nilai tidak kosong dan merupakan angka.

    * **Jumlah (`_amount`)**<br>
    `TextFormField` digunakan untuk mengambil input jumlah. `onChanged` digunakan untuk memperbarui variabel `_amount` setiap kali nilai berubah. `validator` memastikan bahwa nilai tidak kosong dan merupakan angka.

    * **Deskripsi (`_description`)** <br>
    `TextFormField` digunakan untuk mengambil input deskripsi. `onChanged` digunakan untuk memperbarui variabel `_description` setiap kali nilai berubah. `validator` memastikan bahwa nilai tidak kosong.

<br>

4. _Clean Architecture_ merupakan sebuah konsep arsitektur perangkat lunak yang bertujuan untuk menyusun kode ke dalam beberapa lapisan dengan maksud agar kode menjadi lebih terstruktur, mudah dipahami, diuji, dan dimodifikasi. Ketika diterapkan pada aplikasi Flutter, _Clean Architecture_ mengikuti prinsip-prinsip berikut:

    * **Pemisahan Kode Menjadi Beberapa Lapisan** <br>
    Kode dapat diubah menjadi beberapa lapisan agar memudahkan kita dalam melakukan pengerjaan. Berikut adalah pembagian _layer_ yang umumnya digunakan dalam penerapan _Clean Architecture_:
      - Presentasi (_Presentation Layer_): Berisi kode terkait tampilan aplikasi seperti widget dan manajemen status.
      - Domain (_Domain Layer_): Memuat kode yang berkaitan dengan logika bisnis aplikasi, seperti _use case_ dan model.
      - Data (_Data Layer_): Menyimpan kode terkait pengambilan dan penyimpanan data, seperti _repository_ dan sumber data.

    * **Penggunaan _Dependency Inversion_** <br>
    _Dependency Inversion_ adalah salah satu prinsip desain dalam _Clean Architecture_ yang mengajarkan bahwa modul tingkat atas tidak boleh bergantung pada modul tingkat bawah. Sebaliknya, keduanya seharusnya bergantung pada abstraksi (_interface_ atau kelas abstrak). Prinsip ini berguna untuk memisahkan ketergantungan, meningkatkan fleksibilitas, dan membuat kode lebih mudah dipelihara dan diuji.

    * **Penggunaan _Interface_** <br>
    _Interface_ adalah suatu kontrak untuk mendefinisikan perilaku suatu kelas. Penggunaan _interface_ berguna untuk memisahkan implementasi dan definisi sehingga memudahkan pengujian dan modifikasi.

    * **Penggunaan _Unit Test_** <br>
    Penggunaan _unit test_ penting dalam _Clean Architecture_. Penggunaan _unit test_ memungkinkan kita untuk menguji kode secara terpisah di setiap lapisan. Manfaat dari hal ini adalah memastikan bahwa setiap lapisan berfungsi dengan baik dan sesuai dengan kebutuhan.

    * **Prinsip _Single Responsibility_** <br>
    Penerapan prinsip ini penting dalam _Clean Architecture_ karena setiap kelas harus memiliki tanggung jawab tunggal dan pasti memiliki alasan untuk berubah. Hal ini berguna untuk membantu dalam memelihara dan menguji kode.

    * **Menggunakan _Dependency Injection_** <br>
    _Dependency Injection_ adalah sebuah teknik yang digunakan untuk memasukkan objek yang dibutuhkan oleh suatu kelas melalui konstruktor atau setter, sehingga kelas tersebut tidak perlu membuat objek tersebut sendiri.

    * **Penggunaan _Use Case_** <br>
    Di bagian _domain layer_, kita bisa menggunakan _use case_ yang menguraikan tindakan-tindakan yang dapat dilakukan di aplikasi kita. Setiap _use case_ mencerminkan satu aksi khusus dan berinteraksi dengan repositori sehingga hal ini memudahkan kita untuk memahami kode yang dibuat.

    * **Menerapkan _Modularity_** <br>
    Arti _modularity_ dalam konteks ini adalah memecah aplikasi menjadi modul atau paket yang terpisah berdasarkan fitur atau fungsi. Penerapan _modularity_ dalam aplikasi untuk mendukung manajemen dependensi dan menjaga kebersihan kode.

<br>

5. 

<br>

## Bonus Tugas 8
Saya telah mengerjakan bonus dengan membuat beberapa _file_ dart tambahan, yaitu `show_coffee.dart` dan `globals.dart`. Di dalam `globals.dart`, terdapat `List` yang digunakan untuk menampung seluruh model `Coffee` yang pernah dibuat saat melakukan submit _form_ di `coffee_form.dart`. Tampilan _item_ yang sudah dibuat dapat diakses dengan melakukan klik terhadap `Lihat Item` di _Left Drawer_ atau halaman utama.

## Referensi Tugas 8
* _Layout widgets | Flutter._ (n.d.). Flutter documentation. Retrieved November 11, 2023, from https://docs.flutter.dev/ui/widgets/layout

* Khan, S. (n.d.). _Flutter — Clean Architecture. Clean Architecture is a software design… | by Samra Khan._ Medium. Retrieved November 12, 2023, from https://medium.com/@samra.sajjad0001/flutter-clean-architecture-5de5e9b8d093

</details>