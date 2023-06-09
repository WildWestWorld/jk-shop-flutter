import 'package:get/get.dart';
import 'package:jk_shop/pages/index.dart';

/// 主界面依赖
class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartIndexController());
    Get.lazyPut(() => MsgIndexController());
    Get.lazyPut(() => MyIndexController());
    Get.lazyPut(() => MainController());
  }
}
