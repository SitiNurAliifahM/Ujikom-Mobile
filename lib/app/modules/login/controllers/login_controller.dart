import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resepku_p5/app/modules/dashboard/views/dashboard_view.dart';
import 'package:resepku_p5/app/utils/api.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final RxBool isPasswordVisible = false.obs;
  final _getConnect = GetConnect();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void loginNow() async {
    //fungsi _loginNow() dengan deklarasi kata kunci async
    final response = await _getConnect.post(BaseUrl.login, {
      //membuat variabel response yang dideklarasikan dengan kata kunci final, menggunakan fungsi _getConnect.post() untuk melakukan permintaan HTTP POST ke endpoint yang diberikan dalam konstanta BaseUrl.auth, dan mengirimkan email dan password yang dimasukkan pengguna dalam teks emailController dan passwordController. Respons HTTP disimpan dalam variabel response.
      'email': emailController.text, //mengirim email dari input emailController
      'password': passwordController
          .text, //mengirim password dari input passwordController
    });

    if (response.statusCode == 200) {
      authToken.write('access_token', response.body['access_token']);
      Get.offAll(() => const DashboardView());
    } else {
      // Menampilkan snackbar dengan pesan error yang lebih aman
      Get.snackbar(
        'Error',
        response.body['error']?.toString() ??
            response.body['message']?.toString() ??
            'Gagal login, coba lagi.',
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        forwardAnimationCurve: Curves.bounceIn,
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
