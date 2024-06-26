
import 'package:hba/core/localization/changelocal.dart';
import 'package:hba/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

class Language extends GetView<LocaleController>{
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.black),
              
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonLang(
              textbutton: 'العربية',
              onPressed: () {
                    controller.changeLang("ar");
                    Get.toNamed(AppRoute.onBoarding) ;
              },
            ),
            CustomButtonLang(
              textbutton: 'English',
              onPressed: () {
                    controller.changeLang("en");
                    Get.toNamed(AppRoute.onBoarding) ; 
              },
            ),
          ],
        ),
      ),
    );
  }
}
