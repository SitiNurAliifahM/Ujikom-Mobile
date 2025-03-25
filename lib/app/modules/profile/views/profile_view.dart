import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#e8ecd7'),
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.defaultDialog(
                title: "Logout",
                middleText: "Apakah Anda yakin ingin logout?",
                textConfirm: "Ya",
                textCancel: "Batal",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  controller.logout();
                  Get.back();
                },
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'ProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
