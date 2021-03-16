import 'package:flutter/material.dart';
import 'package:catat_uang/ui/profil.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catat Uang'),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text('Halaman Home'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/tambahLog');
        },
        tooltip: 'Tambah Data',
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.pink.shade200),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profil');
            },
            child: Text(
              'Nama Pengguna',
              //_json.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        ListTile(
          title: Text('Grafik'),
          leading: Icon(Icons.pie_chart),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/grafik');
          },
        ),
        ListTile(
          title: Text('Export'),
          leading: Icon(Icons.print),
          // onTap: () {
          //   Navigator.pushNamed(context, '/');
          // },
        ),
        Divider(),
        ListTile(
          title: Text('Kategori'),
          leading: Icon(Icons.grid_view),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/kategori');
          },
        ),
        ListTile(
          title: Text('Pengaturan'),
          leading: Icon(Icons.settings),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/pengaturan');
          },
        ),
        Divider(),
        ListTile(
          title: Text('Tentang'),
          leading: Icon(Icons.info_outline),
          onTap: () {
            Navigator.pop(context);
            return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(
                    "Aplikasi Manajemen Keuangan\n By \nSeptian Puji\n  Framework Flutter",
                    textAlign: TextAlign.center,
                  ),
                );
              },
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text('Test Page'),
          leading: Icon(Icons.settings),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/test');
          },
        ),
      ],
    ),
  );
}
