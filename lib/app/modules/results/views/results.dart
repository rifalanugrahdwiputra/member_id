// ignore_for_file: unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/local_storage.dart';
import '../controllers/results_controller.dart';

class ResultsView extends GetView<ResultsController> {
  const ResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResultsViewPage();
  }
}

class ResultsViewPage extends StatefulWidget {
  const ResultsViewPage({super.key});

  @override
  State<ResultsViewPage> createState() => _ResultsViewPageState();
}

class _ResultsViewPageState extends State<ResultsViewPage> {
  ResultsController controller = ResultsController();

  @override
  void initState() {
    super.initState();
    controller.questions1.text =
        controller.box.read(LocalStorage.questions1) ?? "";
    controller.questions2.text =
        controller.box.read(LocalStorage.questions2) ?? "";
    controller.questions3.text =
        controller.box.read(LocalStorage.questions3) ?? "";
    controller.questions4.text =
        controller.box.read(LocalStorage.questions4) ?? "";
    controller.questions5.text =
        controller.box.read(LocalStorage.questions5) ?? "";
    calculatedQuestion();
    addDataToFirestore();
  }

  calculatedQuestion() {
    if (controller.questions1.text != "") {
      if (controller.questions1.text == controller.questions1Results) {
        controller.questions1Status = true;
        controller.trueCount.value++;
        controller.questionsCount.value++;
      } else {
        controller.questions1Status = false;
        controller.questionsCount.value++;
      }
    }
    if (controller.questions2.text != "") {
      if (controller.questions2.text == controller.questions2Results) {
        controller.questions2Status = true;
        controller.trueCount.value++;
        controller.questionsCount.value++;
      } else {
        controller.questions2Status = false;
        controller.questionsCount.value++;
      }
    }
    if (controller.questions3.text != "") {
      if (controller.questions3.text == controller.questions3Results) {
        controller.questions3Status = true;
        controller.trueCount.value++;
        controller.questionsCount.value++;
      } else {
        controller.questions3Status = false;
        controller.questionsCount.value++;
      }
    }
    if (controller.questions4.text != "") {
      if (controller.questions4.text == controller.questions4Results) {
        controller.questions4Status = true;
        controller.trueCount.value++;
        controller.questionsCount.value++;
      } else {
        controller.questions4Status = false;
        controller.questionsCount.value++;
      }
    }
    if (controller.questions5.text != "") {
      if (controller.questions5.text == controller.questions5Results) {
        controller.questions5Status = true;
        controller.trueCount.value++;
        controller.questionsCount.value++;
      } else {
        controller.questions5Status = false;
        controller.questionsCount.value++;
      }
    }
  }

  void addDataToFirestore() {
    FirebaseFirestore.instance.collection('results').add({
      'correct': controller.trueCount.value,
      'wrong': (controller.questionsCount.value - controller.trueCount.value),
      'updatedAt': FieldValue.serverTimestamp(),
    }).then((value) {
      print("Data berhasil ditambahkan ke Firestore.");
    }).catchError((error) {
      print("Terjadi kesalahan: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
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
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20.0,
            ),
          ),
        ),
        title: const Text(
          "Your Score",
          style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              CircularPercentIndicator(
                radius: 65.0,
                lineWidth: 8.0,
                percent: controller.trueCount.value /
                    controller.questionsCount.value,
                center: Text(
                  "${controller.trueCount.value} / ${controller.questionsCount.value}",
                  style: const TextStyle(
                      fontSize: 14.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold),
                ),
                progressColor: AppColors.percentEnableColor,
                backgroundColor: AppColors.percentDisableColor,
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.blueAccentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    child: Text(
                      "Share your score",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              const Text(
                "Your Report",
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              controller.questions1.text != ""
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "What animal is this?",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            controller.questions1Status == true
                                ? Row(
                                    children: [
                                      const Icon(
                                        Icons.check,
                                        color: AppColors.trueQuestionColor,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        controller.questions1.text,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.close,
                                            color: AppColors.falseQuestionColor,
                                            size: 20.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            controller.questions1.text,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.check,
                                            color: AppColors.trueQuestionColor,
                                            size: 20.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            controller.questions1Results,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                      ],
                    )
                  : Container(),
              controller.questions2.text != ""
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "What party logo is below?",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            controller.questions2Status == true
                                ? Row(
                                    children: [
                                      const Icon(
                                        Icons.check,
                                        color: AppColors.trueQuestionColor,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        controller.questions2.text,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.close,
                                            color: AppColors.falseQuestionColor,
                                            size: 20.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            controller.questions2.text,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.check,
                                            color: AppColors.trueQuestionColor,
                                            size: 20.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            controller.questions2Results,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                      ],
                    )
                  : Container(),
              controller.questions3.text != ""
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Which month of the year has the least number of days?",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            controller.questions3Status == true
                                ? Row(
                                    children: [
                                      const Icon(
                                        Icons.check,
                                        color: AppColors.trueQuestionColor,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        controller.questions3.text,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.close,
                                            color: AppColors.falseQuestionColor,
                                            size: 20.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            controller.questions3.text,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.check,
                                            color: AppColors.trueQuestionColor,
                                            size: 20.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            controller.questions3Results,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                      ],
                    )
                  : Container(),
              controller.questions4.text != ""
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "What animal is this?",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            controller.questions4Status == true
                                ? Row(
                                    children: [
                                      const Icon(
                                        Icons.check,
                                        color: AppColors.trueQuestionColor,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        controller.questions4.text,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.close,
                                            color: AppColors.falseQuestionColor,
                                            size: 20.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            controller.questions4.text,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.check,
                                            color: AppColors.trueQuestionColor,
                                            size: 20.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            controller.questions4Results,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                      ],
                    )
                  : Container(),
              controller.questions5.text != ""
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "What party logo is below?",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            controller.questions5Status == true
                                ? Row(
                                    children: [
                                      const Icon(
                                        Icons.check,
                                        color: AppColors.trueQuestionColor,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        controller.questions5.text,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.close,
                                            color: AppColors.falseQuestionColor,
                                            size: 20.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            controller.questions5.text,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.check,
                                            color: AppColors.trueQuestionColor,
                                            size: 20.0,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            controller.questions5Results,
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
