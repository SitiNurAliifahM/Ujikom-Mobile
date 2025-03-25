import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> logout() async {
    try {
      final box = GetStorage();
      box.remove('token');

      print("Berhasil logout!");

      Get.offAllNamed('/login'); // arahkan ke halaman login
    } catch (e) {
      print("Error saat logout: $e");
    }
  }

}
