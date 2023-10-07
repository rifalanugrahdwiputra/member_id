import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ResultsController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  RxInt trueCount = 0.obs;
  RxInt questionsCount = 0.obs;

  TextEditingController questions1 = TextEditingController();
  TextEditingController questions2 = TextEditingController();
  TextEditingController questions3 = TextEditingController();
  TextEditingController questions4 = TextEditingController();
  TextEditingController questions5 = TextEditingController();

  String questions1Results = "Cat";
  String questions2Results = "Pdip";
  String questions3Results = "February";
  String questions4Results = "Cheeta";
  String questions5Results = "Nasdem";

  bool? questions1Status;
  bool? questions2Status;
  bool? questions3Status;
  bool? questions4Status;
  bool? questions5Status;
}
