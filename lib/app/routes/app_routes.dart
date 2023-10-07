part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const topics = _Paths.topics;
  static const home = _Paths.home;
  static const questionAnimal = _Paths.questionAnimal;
  static const questionPolitics = _Paths.questionPolitics;
  static const questionGk = _Paths.questionGk;
  static const questionAnimalTwo = _Paths.questionAnimalTwo;
  static const questionPoliticsTwo = _Paths.questionPoliticsTwo;
  static const results = _Paths.results;
}

abstract class _Paths {
  static const topics = '/topics';
  static const home = '/home';
  static const questionAnimal = '/questionAnimal';
  static const questionPolitics = '/questionPolitics';
  static const questionGk = '/questionGk';
  static const questionAnimalTwo = '/questionAnimalTwo';
  static const questionPoliticsTwo = '/questionPoliticsTwo';
  static const results = '/results';
}
