part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const topics = _Paths.topics;
  static const home = _Paths.home;
}

abstract class _Paths {
  static const topics = '/topics';
  static const home = '/home';
}
