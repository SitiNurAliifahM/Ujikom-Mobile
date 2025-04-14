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
          padding: const EdgeInsets.all(12.0),
          itemCount: controller.resepList.length,
          itemBuilder: (context, index) {
            final resep = controller.resepList[index];

            return GestureDetector(
              onTap: () {
                // Ganti ke navigasi ke halaman detail
                Get.toNamed('/detail-resep', arguments: resep);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: resep.gambar != null
                          ? Image.network(
                              'http://192.168.0.50:8000/gambars/resep/${resep.gambar}',
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                height: 180,
                                color: Colors.grey[300],
                                child: const Icon(Icons.broken_image, size: 50),
                              ),
                            )
                          : Container(
                              height: 180,
                              color: Colors.grey[300],
                              child: const Icon(Icons.image, size: 50),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        resep.namaResep ?? "Nama tidak tersedia",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
