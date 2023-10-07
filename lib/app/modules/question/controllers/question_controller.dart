import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QuestionController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  TextEditingController questions1 = TextEditingController();
  TextEditingController questions2 = TextEditingController();
  TextEditingController questions3 = TextEditingController();
  TextEditingController questions4 = TextEditingController();
  TextEditingController questions5 = TextEditingController();
}
