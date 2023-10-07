import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id/app/routes/app_pages.dart';
import 'package:member_id/app/utils/app_colors.dart';
import '../../../utils/local_storage.dart';
import '../controllers/question_controller.dart';

class QuestionGkView extends GetView<QuestionController> {
  const QuestionGkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuestionGkViewPage();
  }
}

class QuestionGkViewPage extends StatefulWidget {
  const QuestionGkViewPage({super.key});

  @override
  State<QuestionGkViewPage> createState() => _QuestionGkViewPageState();
}

class _QuestionGkViewPageState extends State<QuestionGkViewPage> {
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
      if (controller.box.read(LocalStorage.questionsGk) == true) {
        setState(() {
          controller.questions3.text = "Skipped";
          controller.box.write(LocalStorage.questions3, "Skipped");
          _timer?.cancel();
        });
        Get.offAllNamed(Routes.results);
      } else {
        setState(() {
          controller.questions3.text = "Skipped";
          controller.box.write(LocalStorage.questions3, "Skipped");
        });
        Get.toNamed(Routes.questionAnimalTwo);
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
            value: 0.4,
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
              const Row(
                children: [
                  Expanded(
                    child: Card(
                      color: AppColors.whiteColor,
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Which month of the year has the least number of days?",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
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
                          controller.questions3.text = "January";
                          controller.box
                              .write(LocalStorage.questions3, "January");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsGk) == true
                            ? Get.offAllNamed(Routes.results)
                            : Get.toNamed(Routes.questionAnimalTwo);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "January".toUpperCase(),
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
                          controller.questions3.text = "February";
                          controller.box
                              .write(LocalStorage.questions3, "February");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsGk) == true
                            ? Get.offAllNamed(Routes.results)
                            : Get.toNamed(Routes.questionAnimalTwo);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "February".toUpperCase(),
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
                          controller.questions3.text = "March";
                          controller.box
                              .write(LocalStorage.questions3, "March");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsGk) == true
                            ? Get.offAllNamed(Routes.results)
                            : Get.toNamed(Routes.questionAnimalTwo);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "March".toUpperCase(),
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
                          controller.questions3.text = "June";
                          controller.box.write(LocalStorage.questions3, "June");
                          _timer?.cancel();
                        });
                        controller.box.read(LocalStorage.questionsGk) == true
                            ? Get.offAllNamed(Routes.results)
                            : Get.toNamed(Routes.questionAnimalTwo);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "June".toUpperCase(),
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
