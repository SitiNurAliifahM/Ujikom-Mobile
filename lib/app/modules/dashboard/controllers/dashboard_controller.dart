import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resepku_p5/app/data/resep_response.dart';
import 'package:resepku_p5/app/modules/kategori/views/kategori_view.dart';
import 'package:resepku_p5/app/modules/dashboard/views/index_view.dart';
import 'package:resepku_p5/app/modules/resep/views/resep_view.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  // final _getConnect = GetConnect();
  // var resepList = <Reseps>[].obs; // Gunakan RxList agar UI bisa update otomatis
  var isLoading = true.obs;

  final token = GetStorage().read('access_token');

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    IndexView(),
    ResepView(),
    // ProfileView(),
    // KategoriView(),
  ];

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
}
