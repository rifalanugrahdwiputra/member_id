import 'package:get/get.dart';
import 'package:member_id/app/modules/question/views/question_animal_two_view.dart';
import 'package:member_id/app/modules/question/views/question_politics_view.dart';
import 'package:member_id/app/modules/results/bindings/results_binding.dart';
import 'package:member_id/app/modules/results/views/results.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/question/bindings/question_binding.dart';
import '../modules/question/views/question_animal_view.dart';
import '../modules/question/views/question_gk_view.dart';
import '../modules/question/views/question_politics_two_view.dart';
import '../modules/topics/bindings/topics_binding.dart';
import '../modules/topics/views/topics.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.topics,
      page: () => const TopicsView(),
      binding: TopicsBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.questionAnimal,
      page: () => const QuestionAnimalView(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: _Paths.questionPolitics,
      page: () => const QuestionPoliticsView(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: _Paths.questionGk,
      page: () => const QuestionGkView(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: _Paths.questionAnimalTwo,
      page: () => const QuestionAnimalTwoView(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: _Paths.questionPoliticsTwo,
      page: () => const QuestionPoliticsTwoView(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: _Paths.results,
      page: () => const ResultsView(),
      binding: ResultsBinding(),
    ),
  ];
}
