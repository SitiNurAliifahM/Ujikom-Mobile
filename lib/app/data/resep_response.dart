class ResepResponse {
  int? id;
  String? namaResep;
  int? idKategori;
  String? deskripsi;
  String? gambar;
  int? idUser;
  String? status;
  String? createdAt;
  String? updatedAt;
  Kategori? kategori;

  ResepResponse(
      {this.id,
      this.namaResep,
      this.idKategori,
      this.deskripsi,
      this.gambar,
      this.idUser,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.kategori});

  ResepResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaResep = json['nama_resep'];
    idKategori = json['id_kategori'];
    deskripsi = json['deskripsi'];
    gambar = json['gambar'];
    idUser = json['id_user'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kategori = json['kategori'] != null
        ? new Kategori.fromJson(json['kategori'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_resep'] = this.namaResep;
    data['id_kategori'] = this.idKategori;
    data['deskripsi'] = this.deskripsi;
    data['gambar'] = this.gambar;
    data['id_user'] = this.idUser;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.kategori != null) {
      data['kategori'] = this.kategori!.toJson();
    }
    return data;
  }
}

class Kategori {
  int? id;
  String? namaKategori;
  String? createdAt;
  String? updatedAt;

  Kategori({this.id, this.namaKategori, this.createdAt, this.updatedAt});

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKategori = json['nama_kategori'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kategori'] = this.namaKategori;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
