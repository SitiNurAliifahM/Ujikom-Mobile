import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:resepku_p5/app/data/resep_response.dart';
import 'dart:convert';

class ResepController extends GetxController {
  //TODO: Implement ResepController
  var resepList = <ResepResponse>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchResep();
  }

  void fetchResep() async {
    try {
      isLoading(true);
      var response =
          await http.get(Uri.parse('http://192.168.0.50:8000/api/resep'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var resepResponse = (jsonData as List)
            .map((data) => ResepResponse.fromJson(data))
            .toList();

        resepList.value = resepResponse;
      } else {
        Get.snackbar("Error", "Gagal mengambil data resep");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
