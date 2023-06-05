import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';
import 'package:jk_shop/pages/system/login_quick/view.dart';

class SplashController extends GetxController {
  SplashController();

  _initData() {
    update(["splash"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // _jumpToPage() {
  //   // 欢迎页
  //   // Future.delayed(const Duration(seconds: 1), () {
  //   //   Get.offAllNamed(RouteNames.systemWelcome);
  //   // });

  //   // 样式配置

  //   if (ConfigService.to.isAlreadyOpen) {
  //     Get.offAllNamed(RouteNames.main);
  //   } else {
  //     Get.offAllNamed(RouteNames.systemWelcome);
  //   }

  // }

  void _jumpToPage() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      if (ConfigService.to.isAlreadyOpen) {
        Get.offAllNamed(RouteNames.main);
      } else {
        Get.offAllNamed(RouteNames.systemWelcome);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();

    //  删除设备启动图

    FlutterNativeSplash.remove();
    _jumpToPage(); // 跳转界面

    _initData();

    // Get.to(const LoginQuickPage());
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
