import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(KategoriController());
    final controller = Get.find<KategoriController>();

    return Scaffold(
      backgroundColor: HexColor('#e8ecd7'),
      appBar: AppBar(
        title: const Text('Kategori Resep'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.kategoriList.isEmpty) {
          return const Center(child: Text('Tidak ada data kategori'));
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Menentukan jumlah kolom
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2, // Mengatur rasio ukuran kotak
            ),
            itemCount: controller.kategoriList.length,
            itemBuilder: (context, index) {
              final kategori = controller.kategoriList[index];
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  // onTap: () {
                  //   Get.snackbar('Kategori Dipilih',
                  //       kategori.namaKategori ?? "Nama tidak tersedia");
                  // },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.category, color: Color.fromARGB(255, 37, 167, 56)),
                        const SizedBox(height: 5),
                        Text(
                          kategori.namaKategori ?? "Nama tidak tersedia",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
