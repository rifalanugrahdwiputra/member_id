import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id/app/routes/app_pages.dart';
import 'package:member_id/app/utils/app_colors.dart';
import '../../../utils/local_storage.dart';
import '../controllers/question_controller.dart';

class QuestionPoliticsView extends GetView<QuestionController> {
  const QuestionPoliticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QuestionPoliticsViewPage();
  }
}

class QuestionPoliticsViewPage extends StatefulWidget {
  const QuestionPoliticsViewPage({super.key});

  @override
  State<QuestionPoliticsViewPage> createState() =>
      _QuestionPoliticsViewPageState();
}

class _QuestionPoliticsViewPageState extends State<QuestionPoliticsViewPage> {
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
          controller.questions2.text = "Skipped";
          controller.box.write(LocalStorage.questions2, "Skipped");
        });
        Get.toNamed(Routes.questionPoliticsTwo);
      } else {
        setState(() {
          controller.questions2.text = "Skipped";
          controller.box.write(LocalStorage.questions2, "Skipped");
        });
        Get.toNamed(Routes.questionGk);
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
            value: 0.2,
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
                              "assets/images/pdi.png",
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
                          controller.questions2.text = "Pdip";
                          controller.box.write(LocalStorage.questions2, "Pdip");
                        });
                        controller.box.read(LocalStorage.questionsPolitik) ==
                                true
                            ? Get.toNamed(Routes.questionPoliticsTwo)
                            : Get.toNamed(Routes.questionGk);
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
                          controller.questions2.text = "Nasdem";
                          controller.box
                              .write(LocalStorage.questions2, "Nasdem");
                        });
                        controller.box.read(LocalStorage.questionsPolitik) ==
                                true
                            ? Get.toNamed(Routes.questionPoliticsTwo)
                            : Get.toNamed(Routes.questionGk);
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
                          controller.questions2.text = "Golkar";
                          controller.box
                              .write(LocalStorage.questions2, "Golkar");
                        });
                        controller.box.read(LocalStorage.questionsPolitik) ==
                                true
                            ? Get.toNamed(Routes.questionPoliticsTwo)
                            : Get.toNamed(Routes.questionGk);
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
                          controller.questions2.text = "Perindo";
                          controller.box
                              .write(LocalStorage.questions2, "Perindo");
                        });
                        controller.box.read(LocalStorage.questionsPolitik) ==
                                true
                            ? Get.toNamed(Routes.questionPoliticsTwo)
                            : Get.toNamed(Routes.questionGk);
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
