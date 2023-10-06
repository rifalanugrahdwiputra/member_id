import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  var surveyorData = [].obs;

  @override
  void onInit() async {
    super.onInit();
  }
}
