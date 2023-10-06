import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TopicsController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  GetStorage box = GetStorage();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
