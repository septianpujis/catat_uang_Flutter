class Kategori {
  int _id;
  String _jenis;
  String _nama;

  //konstruktor 1
  Kategori(this._jenis, this._nama);

  //konstruktor 2
  Kategori.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._jenis = map['jenis'];
    this._nama = map['nama'];
  }

  //getter
  int get id => _id;
  String get jenis => _jenis;
  String get nama => _nama;

  //setter
  set jenis(String value) {
    _jenis = value;
  }

  set nama(String value) {
    _nama = value;
  }

  //konversi dari Kategori ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['jenis'] = jenis;
    map['nama'] = nama;
    return map;
  }
}
