import 'package:flutter/material.dart';

class TambahLog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
      body: Center(
        child: Text('Tambah Data Pengeluaran/Pemasukan'),
      ),
    );
  }
}
