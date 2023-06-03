import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'index.dart';

/// 翻译类
/// Translations来自于getX
class Translation extends Translations {
  // 当前系统语言
  // static Locale? get locale => Get.deviceLocale;
  // 默认语言 Locale(语言代码, 国家代码)
  static const fallbackLocale = Locale('en', 'US');

  // 支持语言列表
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];

// 用于修改组件中的文本信息

// - GlobalMaterialLocalizations.delegate：用于在Material Design中本地化日期、时间、文本等。
// - GlobalWidgetsLocalizations.delegate：用于在应用内本地化常见的文本，比如提示框、按钮等。
// - GlobalCupertinoLocalizations.delegate：用于在Cupertino（iOS）设计中本地化日期、时间、文本等。

  // 代理
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  // 语言代码对应的翻译文本
  @override
  Map<String, Map<String, String>> get keys => {
        'en': localeEn,
        'zh': localeZh,
      };
}
