import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:resepku_p5/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:resepku_p5/app/modules/kategori/controllers/kategori_controller.dart';
import 'package:resepku_p5/app/modules/resep/controllers/resep_controller.dart';

class IndexView extends StatelessWidget {
  const IndexView({super.key});

  final backgroundColor1 = Colors.white;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    final kategoriController = Get.put(KategoriController());
    final resepController = Get.put(ResepController());

    // Tambahkan selectedKategori agar dropdown bisa berubah
    final RxString selectedKategori = 'all'.obs;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (kategoriController.kategoriList.isEmpty) {
        kategoriController.fetchKategori();
      }
      if (resepController.resepList.isEmpty) {
        resepController.fetchResep();
      }
    });

    return Scaffold(
      backgroundColor: HexColor('#e8ecd7'),
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        title: const Text("Selamat Datang di Beranda Pengguna"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Halo, selamat datang di ResepKu!🍽️',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF334155),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Temukan berbagai resep menarik dan simpan favoritmu di sini!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 150, // ubah ukuran sesuai kebutuhan
                    width:
                        150, // tambahkan jika ingin kontrol penuh atas ukuran
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pilih Kategori',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Obx(() {
              if (kategoriController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return DropdownButton<String>(
                isExpanded: true,
                value: selectedKategori.value,
                items: [
                  const DropdownMenuItem(
                    value: 'all',
                    child: Text('Semua Kategori'),
                  ),
                  ...kategoriController.kategoriList.map((kategori) {
                    return DropdownMenuItem(
                      value: kategori.id.toString(),
                      child: Text(kategori.namaKategori ?? ''),
                    );
                  }).toList(),
                ],
                onChanged: (value) {
                  selectedKategori.value = value!;
                  if (value == 'all') {
                    resepController.fetchResep();
                  } else {
                    resepController.fetchResepByKategori(int.parse(value));
                  }
                },
              );
            }),
            const SizedBox(height: 24),
            const Text(
              'Daftar Resep',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Obx(() {
              if (resepController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (resepController.resepList.isEmpty) {
                return const Center(
                    child: Text('Tidak ada resep yang ditemukan'));
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: resepController.resepList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // jumlah kolom dalam 1 baris
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 120, // mengatur tinggi
                ),
                itemBuilder: (context, index) {
                  final resep = resepController.resepList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/detail-resep',
                          arguments:
                              resep); // 'resep' harus bertipe ResepResponse
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.food_bank,
                              size: 20, color: Colors.green),
                          const SizedBox(height: 6),
                          Text(
                            resep.namaResep ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
