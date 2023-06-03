import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

class RegisterPinController extends GetxController {
  RegisterPinController();

  // 注册界面传值
  UserRegisterReq? req = Get.arguments;

  // ping 文字输入控制器
  TextEditingController pinController = TextEditingController();

  // 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  _initData() {
    update(["register_pin"]);
  }

  void onTap() {}

  // 注册
  Future<void> _register() async {
    try {
      Loading.show();

      // 暂时提交，后续改 aes 加密后处理
      bool isOk = await UserApi.register(req);
      if (isOk) {
        Loading.success(
            LocaleKeys.commonMessageSuccess.trParams({"method": "Register"}));
        Get.back(result: true);
      }

      // 提示成功
      // Loading.success(
      //     LocaleKeys.commonMessageSuccess.trParams({"method": "Register"}));
      // Get.back(result: true);
    } finally {
      Loading.dismiss();
    }
  }

  // pin 触发提交
  void onPinSubmit(String val) {
    debugPrint("onPinSubmit: $val");

    _register();
  }

  // 验证 pin
  String? pinValidator(val) {
    return val == '111111'
        ? null
        : LocaleKeys.commonMessageIncorrect.trParams({"method": "Pin"});
  }

  // 按钮提交
  void onBtnSubmit() {}

  // 按钮返回
  void onBtnBackup() {
    Get.back();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    pinController.dispose();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
