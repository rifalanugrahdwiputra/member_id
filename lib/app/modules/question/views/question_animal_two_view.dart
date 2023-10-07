import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id/app/utils/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/local_storage.dart';
import '../controllers/question_controller.dart';

class QuestionAnimalTwoView extends GetView<QuestionController> {
  const QuestionAnimalTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuestionAnimalTwoViewPage();
  }
}

class QuestionAnimalTwoViewPage extends StatefulWidget {
  const QuestionAnimalTwoViewPage({super.key});

  @override
  State<QuestionAnimalTwoViewPage> createState() =>
      _QuestionAnimalTwoViewPageState();
}

class _QuestionAnimalTwoViewPageState extends State<QuestionAnimalTwoViewPage> {
  QuestionController controller = QuestionController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (mounted) {
        setState(() {
          navigateToNextPage();
        });
      }
    });
  }

  void navigateToNextPage() {
    setState(() {
      if (controller.box.read(LocalStorage.questionsAnimal) == true) {
        setState(() {
          controller.questions4.text = "Skipped";
          controller.box.write(LocalStorage.questions4, "Skipped");
          _timer?.cancel();
        });
        Get.offAllNamed(Routes.results);
      } else {
        setState(() {
          controller.questions4.text = "Skipped";
          controller.box.write(LocalStorage.questions4, "Skipped");
        });
        Get.toNamed(Routes.questionPoliticsTwo);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20.0,
            ),
          ),
        ),
        title: const Text(
          "Quiz Page",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () {
                  Get.offAllNamed(Routes.home);
                  controller.box.remove(LocalStorage.questions1);
                  controller.box.remove(LocalStorage.questions2);
                  controller.box.remove(LocalStorage.questions3);
                  controller.box.remove(LocalStorage.questions4);
                  controller.box.remove(LocalStorage.questions5);
                  controller.box.remove(LocalStorage.questionsPolitik);
                  controller.box.remove(LocalStorage.questionsAnimal);
                  controller.box.remove(LocalStorage.questionsGk);
                },
                child: const Text(
                  "Exit",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(5.0),
          child: LinearProgressIndicator(
            value: 0.6,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.indicatorColor),
            backgroundColor: AppColors.disableIndicatorColor,
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: AppColors.whiteColor,
                      elevation: 10.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              "What animal is this?",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                            ),
                            Image.asset(
                              "assets/images/cheetah.png",
                              height: 150.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          controller.questions4.text = "Lion";
                          controller.box.write(LocalStorage.questions4, "Lion");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsAnimal) ==
                                true
                            ? Get.offAllNamed(Routes.results)
                            : Get.toNamed(Routes.questionPoliticsTwo);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Lion".toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          controller.questions4.text = "Cheeta";
                          controller.box
                              .write(LocalStorage.questions4, "Cheeta");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsAnimal) ==
                                true
                            ? Get.offAllNamed(Routes.results)
                            : Get.toNamed(Routes.questionPoliticsTwo);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Cheeta".toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          controller.questions4.text = "Tiger";
                          controller.box
                              .write(LocalStorage.questions4, "Tiger");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsAnimal) ==
                                true
                            ? Get.offAllNamed(Routes.results)
                            : Get.toNamed(Routes.questionPoliticsTwo);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Tiger".toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          controller.questions4.text = "Wolf";
                          controller.box.write(LocalStorage.questions4, "Wolf");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsAnimal) ==
                                true
                            ? Get.offAllNamed(Routes.results)
                            : Get.toNamed(Routes.questionPoliticsTwo);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Wolf".toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
