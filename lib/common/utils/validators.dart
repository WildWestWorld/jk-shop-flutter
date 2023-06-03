import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

/// 表单验证
class Validators {
  /// Validatorless.password(6, 20, 'password must have between 6 and 20 digits')
  static FormFieldValidator<String> password(int min, int max, String m) =>
      (v) {
        if (v?.isEmpty ?? true) return null;
        if ((v?.length ?? 0) < min) return m;
        if ((v?.length ?? 0) > max) return m;
        return null;
      };
}

// 验证 pin
String? pinValidator(val) {
  return val == '111111'
      ? null
      : LocaleKeys.commonMessageIncorrect.trParams({"method": "Pin"});
}
