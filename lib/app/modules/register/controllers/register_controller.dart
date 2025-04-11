import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resepku_p5/app/modules/dashboard/views/dashboard_view.dart';
import 'package:resepku_p5/app/utils/api.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final _getConnect = GetConnect();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();

  void registerNow() async {
    final response = await _getConnect.post(BaseUrl.register, {
      'username': usernameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      authToken.write('token', response.body['token']);
      Get.offAll(() => const DashboardView());
    } else {
      String errorMsg = response.body['error'] ??
          response.body['message'] ??
          'Terjadi kesalahan';

      Get.snackbar(
        'Error',
        errorMsg,
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

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
      emailController.dispose();
      passwordController.dispose();
      usernameController.dispose();
      super.onClose();
    }
  }
}
