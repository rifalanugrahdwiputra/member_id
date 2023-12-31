import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id/app/utils/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/local_storage.dart';
import '../controllers/question_controller.dart';

class QuestionAnimalView extends GetView<QuestionController> {
  const QuestionAnimalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuestionAnimalViewPage();
  }
}

class QuestionAnimalViewPage extends StatefulWidget {
  const QuestionAnimalViewPage({super.key});

  @override
  State<QuestionAnimalViewPage> createState() => _QuestionAnimalViewPageState();
}

class _QuestionAnimalViewPageState extends State<QuestionAnimalViewPage> {
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
          controller.questions1.text = "Skipped";
          controller.box.write(LocalStorage.questions1, "Skipped");
          _timer?.cancel();
        });
        Get.toNamed(Routes.questionAnimalTwo);
      } else {
        setState(() {
          controller.questions1.text = "Skipped";
          controller.box.write(LocalStorage.questions1, "Skipped");
        });
        Get.toNamed(Routes.questionPolitics);
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
            value: 0,
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
                              "assets/images/cat.png",
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
                          controller.questions1.text = "Lion";
                          controller.box.write(LocalStorage.questions1, "Lion");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsAnimal) ==
                                true
                            ? Get.toNamed(Routes.questionAnimalTwo)
                            : Get.toNamed(Routes.questionPolitics);
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
                          controller.questions1.text = "Cat";
                          controller.box.write(LocalStorage.questions1, "Cat");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsAnimal) ==
                                true
                            ? Get.toNamed(Routes.questionAnimalTwo)
                            : Get.toNamed(Routes.questionPolitics);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Cat".toUpperCase(),
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
                          controller.questions1.text = "Tiger";
                          controller.box
                              .write(LocalStorage.questions1, "Tiger");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsAnimal) ==
                                true
                            ? Get.toNamed(Routes.questionAnimalTwo)
                            : Get.toNamed(Routes.questionPolitics);
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
                          controller.questions1.text = "Wolf";
                          controller.box.write(LocalStorage.questions1, "Wolf");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsAnimal) ==
                                true
                            ? Get.toNamed(Routes.questionAnimalTwo)
                            : Get.toNamed(Routes.questionPolitics);
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
