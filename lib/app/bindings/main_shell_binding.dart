import 'package:get/get.dart';

import '../navigation/main_shell_controller.dart';

class MainShellBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainShellController>(MainShellController.new);
  }
}
