import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';

import '../controllers/topics_controller.dart';

class TopicsView extends GetView<TopicsController> {
  const TopicsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  color: AppColors.whiteColor,
                  shadowColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Obx(
                      () => Form(
                        key: controller.key,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            Text(
                              "Login".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor.withOpacity(0.8),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Masukan Username',
                                hintStyle: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor.withOpacity(0.6),
                                  fontFamily: 'Quicksand',
                                ),
                                filled: true,
                                fillColor: AppColors.primaryColor,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.circular(5.0), // Radius 5px
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(5.0), // Radius 5px
                                  borderSide: const BorderSide(
                                    width: 2.0,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
