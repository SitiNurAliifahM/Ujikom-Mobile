import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:resepku_p5/app/data/kategori_response.dart';
import 'package:resepku_p5/app/utils/api.dart';
import 'dart:convert';

class KategoriController extends GetxController {
  var kategoriList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchKategori();
    super.onInit();
  }

 void fetchKategori() async {
    try {
      isLoading(true);
      var response =
          await http.get(Uri.parse('http://192.168.74.252:8000/api/kategori'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var kategoriResponse = KategoriResponse.fromJson(jsonData);

        if (kategoriResponse.data != null) {
          kategoriList.value = kategoriResponse.data!;
        }
      } else {
        Get.snackbar("Error", "Gagal mengambil data kategori");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
