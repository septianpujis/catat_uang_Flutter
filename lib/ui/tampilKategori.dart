import 'package:flutter/material.dart';
import 'package:catat_uang/ui/EntryKategori.dart';
import 'package:catat_uang/models/kategori.dart';
import 'package:catat_uang/helper/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class TampilKategori extends StatefulWidget {
  @override
  KategoriState createState() => KategoriState();
}

class KategoriState extends State<TampilKategori> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Kategori> kategoriList;

  @override
  Widget build(BuildContext context) {
    if (kategoriList == null) {
      // ignore: deprecated_member_use
      kategoriList = List<Kategori>();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var kategori = await tambahDataKate(context, null);
          if (kategori != null) addKate(kategori);
        },
        tooltip: 'Tambah Kategori',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Kategori> tambahDataKate(
      BuildContext context, Kategori kategori) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryKategori(kategori);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.people),
            ),
            title: Text(
              this.kategoriList[index].nama,
              style: textStyle,
            ),
            subtitle: Text(kategoriList[index].jenis),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteKate(kategoriList[index]);
              },
            ),
            onTap: () async {
              var kategori =
                  await tambahDataKate(context, this.kategoriList[index]);
              if (kategori != null) editKate(kategori);
            },
          ),
        );
      },
    );
  }

  void addKate(Kategori object) async {
    int result = await dbHelper.insertKategori(object);
    if (result > 0) {
      updateListView();
    }
  }

  void editKate(Kategori object) async {
    int result = await dbHelper.updateKategori(object);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteKate(Kategori object) async {
    int result = await dbHelper.deleteKategori(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Kategori>> kategoriListFuture = dbHelper.getKategoriList();
      kategoriListFuture.then((contactList) {
        setState(() {
          this.kategoriList = contactList;
          this.count = contactList.length;
        });
      });
    });
  }
}
