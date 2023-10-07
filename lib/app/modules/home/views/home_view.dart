import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id/app/utils/app_colors.dart';
import 'package:member_id/app/utils/local_storage.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeViewPage();
  }
}

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({super.key});

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.box.remove(LocalStorage.questions1);
    controller.box.remove(LocalStorage.questions2);
    controller.box.remove(LocalStorage.questions3);
    controller.box.remove(LocalStorage.questions4);
    controller.box.remove(LocalStorage.questions5);
    controller.box.remove(LocalStorage.questionsPolitik);
    controller.box.remove(LocalStorage.questionsAnimal);
    controller.box.remove(LocalStorage.questionsGk);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: ListView(
            children: [
              Image.asset(
                "assets/images/lamp.png",
                height: 120.0,
              ),
              const SizedBox(height: 40.0),
              const Text(
                "Flutter Quiz App",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Learn",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Icon(
                    Icons.circle,
                    color: AppColors.whiteColor,
                    size: 5.0,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    "Take Quiz",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Icon(
                    Icons.circle,
                    color: AppColors.whiteColor,
                    size: 5.0,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    "Repeat",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.blueAccentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.questionAnimal);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Play".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        side: const BorderSide(
                          color: AppColors.blueAccentColor,
                          width: 2.0,
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.topics);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Topics".toUpperCase(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: AppColors.blueAccentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.share,
                        size: 20.0,
                        color: AppColors.shareColor,
                      ),
                      SizedBox(
                        width: 5.0,
                        height: 2.0,
                      ),
                      Text(
                        "Share",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 22.0,
                        color: AppColors.starColor,
                      ),
                      SizedBox(
                        width: 5.0,
                        height: 4.0,
                      ),
                      Text(
                        "Rate Us",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
