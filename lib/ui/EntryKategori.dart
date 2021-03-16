import 'package:flutter/material.dart';
import 'package:catat_uang/models/kategori.dart';

class EntryKategori extends StatefulWidget {
  final Kategori kategori;

  EntryKategori(this.kategori);

  @override
  EntryKategoriState createState() => EntryKategoriState(this.kategori);
}

class EntryKategoriState extends State<EntryKategori> {
  Kategori kategori;

  EntryKategoriState(this.kategori);

  TextEditingController controllerNama = TextEditingController();
  List<String> list = ['Pemasukan', 'Pengeluaran'];
  String aktiv = 'Pemasukan';

  void onChanged(String value) {
    setState(() {
      aktiv = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kategori != null) {
      controllerNama.text = kategori.nama;
      aktiv = kategori.jenis;
    }

    return Scaffold(
      appBar: AppBar(
        title: kategori == null ? Text('Tambah Data') : Text('Ubah Data'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // jenis
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: DropdownButton(
                value: aktiv,
                items: list.map((String val) {
                  return DropdownMenuItem(value: val, child: (Text(val)));
                }).toList(),
                onChanged: (String value) {
                  onChanged(value);
                },
              ),
            ),
            // nama
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: controllerNama,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),

            // tombol
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  // tombol simpan
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Simpan',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if (kategori == null) {
                          // tambah data
                          kategori = Kategori(aktiv, controllerNama.text);
                        } else {
                          // ubah data
                          kategori.nama = controllerNama.text;
                          kategori.jenis = aktiv;
                        }
                        // kembali ke layar sebelumnya dengan membawa objek kategori
                        Navigator.pop(context, kategori);
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  // tombol batal
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Batal',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
