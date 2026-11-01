import 'package:get/get.dart';

/// বটম নেভিগেশনের বর্তমান ট্যাব ধরে রাখে।
/// শুধু UI state, কোনো business logic এখানে থাকবে না।
class MainShellController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
