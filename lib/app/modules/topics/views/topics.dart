import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id/app/utils/local_storage.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../controllers/topics_controller.dart';

class TopicsView extends GetView<TopicsController> {
  const TopicsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TopicsViewPage();
  }
}

class TopicsViewPage extends StatefulWidget {
  const TopicsViewPage({super.key});

  @override
  State<TopicsViewPage> createState() => _TopicsViewPageState();
}

class _TopicsViewPageState extends State<TopicsViewPage> {
  TopicsController controller = TopicsController();

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
          "Topics",
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
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.questionPolitics);
                        controller.box
                            .write(LocalStorage.questionsPolitik, true);
                      },
                      child: const Card(
                        color: AppColors.cardColor,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pollitics",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Icon(
                                Icons.play_arrow,
                                color: AppColors.whiteColor,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.questionAnimal);
                        controller.box
                            .write(LocalStorage.questionsAnimal, true);
                      },
                      child: const Card(
                        color: AppColors.cardColor,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Animals",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Icon(
                                Icons.play_arrow,
                                color: AppColors.whiteColor,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.questionGk);
                        controller.box.write(LocalStorage.questionsGk, true);
                      },
                      child: const Card(
                        color: AppColors.cardColor,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gk",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Icon(
                                Icons.play_arrow,
                                color: AppColors.whiteColor,
                                size: 20.0,
                              ),
                            ],
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
