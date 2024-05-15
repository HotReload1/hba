import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hba/controller/settings_controller.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/view/about_us_screen.dart';
import 'package:hba/view/widget/home/setting_item.dart';
import 'package:hba/view/widget/settings/profile.dart';

import '../../screen/auth/login.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => Login()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          const Profile(),
          const SizedBox(height: 40),
          const SettingItem(
            title: "General Setting",
            leadingIcon: Icons.settings,
            leadingIconColor: AppColor.orange,
          ),
          const SizedBox(height: 10),
          const SettingItem(
            title: "Bookings",
            leadingIcon: Icons.bookmark_border,
            leadingIconColor: AppColor.blue,
          ),
          const SizedBox(height: 10),
          const SettingItem(
            title: "Favorites",
            leadingIcon: Icons.favorite,
            leadingIconColor: AppColor.red,
          ),
          const SizedBox(height: 10),
          SettingItem(
            title: "About Us",
            leadingIcon: Icons.privacy_tip_outlined,
            leadingIconColor: AppColor.green,
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AboutUsScreen())),
          ),
          const SizedBox(height: 10),
          SettingItem(
            title: "Log Out",
            leadingIcon: Icons.logout_outlined,
            leadingIconColor: AppColor.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  message: const Text("Would you like to log out?"),
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () => signOut(context),
                      child: const Text(
                        "Log Out",
                        style: TextStyle(color: AppColor.actionColor),
                      ),
                    )
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text("Cancel"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
