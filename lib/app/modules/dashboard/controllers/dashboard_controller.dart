import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resepku_p5/app/data/resep_response.dart';
import 'package:resepku_p5/app/modules/dashboard/views/index_view.dart';
import 'package:resepku_p5/app/modules/profile/views/profile_view.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  var isLoading = true.obs;
  var selectedCategory = 'all'.obs;
  var resepList = <ResepResponse>[].obs;
  var isLoadingResep = false.obs;

  final token = GetStorage().read('access_token');

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    IndexView(),
    ProfileView(),
  ];

  @override
  void onInit() {
    print('✅ DashboardController injected!');
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
