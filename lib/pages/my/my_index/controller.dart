import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';
import 'package:jk_shop/pages/index.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  _initData() {
    update(["my_index"]);
  }

  // 注销
  void onLogout() async {
    await UserService.to.logout();
    Get.find<MainController>().onJumpToPage(0);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
