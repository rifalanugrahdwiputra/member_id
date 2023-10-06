part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const oneScreen = _Paths.oneScreen;
  static const home = _Paths.home;
}

abstract class _Paths {
  static const oneScreen = '/one-screen';
  static const home = '/home';
}
