import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/resep_controller.dart';

class ResepView extends GetView<ResepController> {
  const ResepView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResepController());

    return Scaffold(
      backgroundColor: HexColor('#e8ecd7'),
      appBar: AppBar(
        title: const Text('Daftar Resep'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.resepList.isEmpty) {
          return const Center(child: Text('Tidak ada data resep'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: controller.resepList.length,
          itemBuilder: (context, index) {
            final resep = controller.resepList[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                // onTap: () {
                //   Get.snackbar('Resep Dipilih',
                //       resep.namaResep ?? "Nama tidak tersedia");
                // },
                title: Text(resep.namaResep ?? "Nama tidak tersedia",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(resep.deskripsi ?? "Deskripsi tidak tersedia"),
              ),
            );
          },
        );
      }),
    );
  }
}
