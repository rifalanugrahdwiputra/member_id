import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QuestionController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
}
