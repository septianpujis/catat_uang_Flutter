import 'package:flutter/material.dart';
import 'package:catat_uang/ui/tampilKategori.dart';
import 'package:catat_uang/ui/home.dart';
import 'package:catat_uang/ui/tambahLog.dart';
import 'package:catat_uang/ui/profil.dart';
import 'package:catat_uang/ui/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catat Uang',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) {
          return Home();
        },
        '/profil': (BuildContext context) {
          return Profil();
        },
        '/grafik': (BuildContext context) {
          return Grafik();
        },
        '/kategori': (BuildContext context) {
          return TampilKategori();
        },
        '/pengaturan': (BuildContext context) {
          return Pengaturan();
        },
        '/tambahLog': (BuildContext context) {
          return TambahLog();
        },
        '/test': (BuildContext context) {
          return Test(storage: CounterStorage());
        }
      },
    );
  }
}

class Grafik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grafik Keuangan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('Halaman Grafik'),
      ),
    );
  }
}

class Pengaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('Halaman Pengaturan'),
      ),
    );
  }
}
