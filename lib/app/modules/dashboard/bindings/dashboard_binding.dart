import 'package:get/get.dart';
import 'package:resepku_p5/app/modules/kategori/controllers/kategori_controller.dart';
import 'package:resepku_p5/app/modules/resep/controllers/resep_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<KategoriController>(() => KategoriController());
    Get.lazyPut<ResepController>(() => ResepController());
  }
}
