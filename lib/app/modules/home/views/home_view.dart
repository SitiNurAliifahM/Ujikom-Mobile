import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: HexColor(
          '#e8ecd7'), // Menentukan warna latar belakang Scaffold dengan kode warna heksadesimal
      body: SingleChildScrollView(
      child:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // Menentukan posisi tampilan vertikal pada tengah halaman
          crossAxisAlignment: CrossAxisAlignment
              .center, // Menentukan posisi tampilan horizontal pada tengah halaman
          children: [
            Lottie.asset(
              // 'https://gist.githubusercontent.com/olipiskandar/2095343e6b34255dcfb042166c4a3283/raw/d76e1121a2124640481edcf6e7712130304d6236/praujikom_kucing.json',
              'assets/lottie/food.json',
              width: 300,
              height: 375,
              fit: BoxFit.contain, 
            ),
            const SizedBox(
              height:
                  15, // Menentukan jarak vertikal antara widget Lottie dan Text
            ),
            Text(
              'Resepku', // Isi teks pada widget Text
              style: GoogleFonts.robotoSlab(
                textStyle: const TextStyle(
                  fontWeight:
                      FontWeight.bold, // Menentukan ketebalan font pada teks
                  fontSize: 30, // Menentukan ukuran font pada teks
                ),
              ),
            ),
          ],
        ),
      ),
      ), 
    );
  }
}
