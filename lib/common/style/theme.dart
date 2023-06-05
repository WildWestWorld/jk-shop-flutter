// 主题色

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'index.dart';

/// 主题
class AppTheme {
  /// 亮色
  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,
    fontFamily: "Montserrat",

    // 防止 系统栏颜色有的时候会变成白色，这样就不能看清楚系统栏信息了 只针对IOS。
    //针对安卓的在global文件
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark, // appBar 暗色 , 和主题色相反
      //样式正好和我们的 app 样式相反，这样才能反显文字。

      //我们这边调整了 appBar 的透明、图标颜色、标题样式

      // 背景透明
      backgroundColor: Colors.transparent,
      // 取消阴影
      elevation: 0,
      // 图标样式
      iconTheme: IconThemeData(
        color: Color(0xFF5F84FF),
      ),
      // 标题
      titleTextStyle: TextStyle(
        color: Color(0xFF4D4D4D),
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  /// 暗色
  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
    fontFamily: "Montserrat",
    // 防止 系统栏颜色有的时候会变成白色，这样就不能看清楚系统栏信息了 只针对IOS。
    //针对安卓的在global文件
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light, // appBar 亮色 , 和主题色相反
      //样式正好和我们的 app 样式相反，这样才能反显文字。
    ),
  );
}
