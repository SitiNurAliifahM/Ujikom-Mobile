import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resepku_p5/app/modules/profile/controllers/profile_controller.dart';

class ProfileView extends GetView {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
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
