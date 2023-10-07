import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id/app/routes/app_pages.dart';
import 'package:member_id/app/utils/app_colors.dart';
import 'package:member_id/app/utils/local_storage.dart';
import '../controllers/question_controller.dart';

class QuestionPoliticsTwoView extends GetView<QuestionController> {
  const QuestionPoliticsTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuestionPoliticsTwoViewPage();
  }
}

class QuestionPoliticsTwoViewPage extends StatefulWidget {
  const QuestionPoliticsTwoViewPage({super.key});

  @override
  State<QuestionPoliticsTwoViewPage> createState() =>
      _QuestionPoliticsTwoViewPageState();
}

class _QuestionPoliticsTwoViewPageState
    extends State<QuestionPoliticsTwoViewPage> {
  QuestionController controller = QuestionController();
  int countdown = 10;
  late Future<void> timerFuture;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timerFuture = Future.delayed(Duration(seconds: countdown), () {
      navigateToNextPage();
    });
  }

  void navigateToNextPage() {
    setState(() {
      if (controller.box.read(LocalStorage.questionsPolitik) == true) {
        setState(() {
          controller.questions5.text = "Skipped";
          controller.box.write(LocalStorage.questions5, "Skipped");
        });
        Get.toNamed(Routes.results);
      } else {
        setState(() {
          controller.questions5.text = "Skipped";
          controller.box.write(LocalStorage.questions5, "Skipped");
        });
        Get.offAllNamed(Routes.results);
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
            value: 0.8,
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
                              "What party logo is below?",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                            ),
                            Image.asset(
                              "assets/images/nasdem.png",
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
                          controller.questions5.text = "Pdip";
                          controller.box.write(LocalStorage.questions5, "Pdip");
                        });
                        controller.box.read(LocalStorage.questionsPolitik) ==
                                true
                            ? Get.toNamed(Routes.results)
                            : Get.offAllNamed(Routes.results);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Pdip".toUpperCase(),
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
                          controller.questions5.text = "Nasdem";
                          controller.box
                              .write(LocalStorage.questions5, "Nasdem");
                        });
                        controller.box.read(LocalStorage.questionsPolitik) ==
                                true
                            ? Get.toNamed(Routes.results)
                            : Get.offAllNamed(Routes.results);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Nasdem".toUpperCase(),
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
                          controller.questions5.text = "Glokar";
                          controller.box
                              .write(LocalStorage.questions5, "Golkar");
                        });
                        controller.box.read(LocalStorage.questionsPolitik) ==
                                true
                            ? Get.toNamed(Routes.results)
                            : Get.offAllNamed(Routes.results);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Golkar".toUpperCase(),
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
                          controller.questions5.text = "Perindo";
                          controller.box
                              .write(LocalStorage.questions5, "Perindo");
                        });
                        controller.box.read(LocalStorage.questionsPolitik) ==
                                true
                            ? Get.toNamed(Routes.results)
                            : Get.offAllNamed(Routes.results);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Perindo".toUpperCase(),
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
