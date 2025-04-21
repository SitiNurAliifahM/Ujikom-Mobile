import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:resepku_p5/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:resepku_p5/app/modules/kategori/controllers/kategori_controller.dart';
import 'package:resepku_p5/app/modules/resep/controllers/resep_controller.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(DashboardController()); // <-- Registrasi controller di awal
  Get.put(KategoriController());
  Get.put(ResepController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Resep",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
    ),
  );
}
