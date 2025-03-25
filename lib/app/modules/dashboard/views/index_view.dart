import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:resepku_p5/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class IndexView extends GetView<DashboardController> {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: HexColor('#e8ecd7'),
      appBar: AppBar(
        title: const Text('Dasbor Admin'),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Get.toNamed('/profile');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ROW UNTUK TEKS DAN GAMBAR
            // TEKS & GAMBAR DALAM KOTAK PUTIH
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87),
                            children: [
                              TextSpan(
                                text:
                                    'Selamat datang di halaman dasbor admin! ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: '👋'), // Emoji
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Resep baru, komentar segar, dan pengguna aktif menanti! Kelola semuanya di sini.',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16), // Jarak antara teks dan gambar
                  Image.asset(
                    'assets/images/masak.png', // Ganti dengan ilustrasi kamu
                    width: 120,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // ROW UNTUK KARTU JUMLAH PENGGUNA & RESEP
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildStatCard(Icons.person, "Jumlah Pengguna", "3"),
                SizedBox(width: 16),
                _buildStatCard(Icons.menu_book, "Jumlah Resep", "7"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // WIDGET KARTU INFORMASI
  Widget _buildStatCard(IconData icon, String title, String count) {
    return Container(
      width: 120,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 36, color: Colors.black87),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          SizedBox(height: 4),
          Text(count,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
