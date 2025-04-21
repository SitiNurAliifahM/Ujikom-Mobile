import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepku_p5/app/data/resep_response.dart';

class DetailResepView extends StatelessWidget {
  const DetailResepView({super.key});

  // Fungsi untuk menghapus tag HTML dari string
  String removeHtmlTags(String htmlText) {
    final regex = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(regex, '').trim();
  }

  @override
  Widget build(BuildContext context) {
    final resep = Get.arguments;
    if (resep == null || resep is! ResepResponse) {
      return const Scaffold(
        body: Center(child: Text('Data resep tidak tersedia.')),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(resep.namaResep ?? 'Detail Resep'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green[600],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar resep
            if (resep.gambar != null && resep.gambar!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  resep.gambar!,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    height: 220,
                    child: const Center(child: Icon(Icons.image_not_supported)),
                  ),
                ),
              )
            else
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 50, color: Colors.grey),
                ),
              ),
            const SizedBox(height: 20),

            // Nama resep
            Text(
              resep.namaResep ?? '',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Kategori
            Row(
              children: [
                const Icon(Icons.category, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  resep.kategori?.namaKategori ?? '-',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Deskripsi
            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              removeHtmlTags(resep.deskripsi ?? '-'),
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
