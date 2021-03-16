class Log_uang {
  int _id;
  String _tanggal;
  String _masuk;
  String _keluar;
  int _kategoriId;

  //konstruktor 1
  Log_uang(this._tanggal, this._masuk, this._keluar, this._kategoriId);
  //konstruktor 2
  Log_uang.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._tanggal = map['tanggal'];
    this._masuk = map['uangMasuk'];
    this._keluar = map['uangKeluar'];
    this._kategoriId = map['kategori'];
  }

  //setter
  set tanggal(String value) {
    _tanggal = value;
  }

  set masuk(String value) {
    _masuk = value;
  }

  set keluar(String value) {
    _keluar = value;
  }

  set kategori(int value) {
    _kategoriId = value;
  }

  //getter
  int get id => _id;
  String get tanggal => _tanggal;
  String get masuk => _masuk;
  String get keluar => _keluar;
  int get kategori => _kategoriId;

  //konverter
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['tanggal'] = tanggal;
    map['masuk'] = masuk;
    map['keluar'] = keluar;
    map['kategori'] = kategori;
    return map;
  }
}
