import 'dart:ui';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../index.dart';

// package_info_plus
// 是一个Flutter插件包，它提供了获取有关应用程序包的信息的功能。
// 通过使用这个包，我们可以获得波包版本号、名称、构建编号和其它一些有用的信息。

// ConfigService 类转变为 GetxService 类的子类，这样就可以使用 Get 包提供的一些便捷方法和状态管理功能。
//   GetxService 是 Get 包中提供的一个基类，它可以将Dart类转化为单例服务，这意味着它只会被实例化一次，
//   并且可以通过 Get.find() 方法在整个应用程序中获取该类的单例实例。
//  除了单例模式外， GetxService 还提供了类似状态管理的功能，
//  即我们可以在服务中定义并读取一些全局共享的变量或状态，同时在需要的时候更新它们。
//  这种状态管理的方式可以让我们在整个应用程序中轻松地共享和传递数据。

/// 配置服务
class ConfigService extends GetxService {
  // 这是一个单例写法
  // Get.find 会获取到当前文件的实例 不继承 GetXService无法使用
  static ConfigService get to => Get.find();
// PlatformDispatcher 来自于 dart.ui
// PlatformDispatcher.instance.locale
//用于获取设备当前的语言环境（Locale），如果未指定具体语言，则默认使用英语作为会话的主要语言。它通过调用 PlatformDispatcher.instance.locale 方法获取设备当前的区域设置，然后将其赋值给 locale 变量。如果要指定其他语言环境，则可以在代码中设置不同的区域设置来更改主要语言。
  Locale locale = PlatformDispatcher.instance.locale;

  PackageInfo? _platform;
  // 获取到_platform里面的版本
  String get version => _platform?.version ?? '-';

  // 主题色
  final RxBool _isDarkModel = Get.isDarkMode.obs;
  bool get isDarkModel => _isDarkModel.value;

  // 初始化
  Future<ConfigService> init() async {
    // 获取系统依赖包的创建的实例
    await getPlatform();
    // 初始化语言包
    initLocale();
    // 初始化主题
    initTheme();

    return this;
  }

  // 获取系统依赖包的创建的实例
  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

// initLocale，主要用于设置应用程序的语言环境
// 这个函数首先尝试从本地存储中读取所存储的语言代码（langCode）。
// 如果本地存储中没有存储语言代码，则默认使用英语作为应用程序的语言环境。
// 如果本地存储中有语言代码，则在翻译类（Translation class）中指定的支持的语言环境列表中查找匹配该代码的语言环境。
// 如果找到匹配项，则设置应用程序的语言环境为匹配项的语言环境。如果未找到匹配项，则保留默认的英语语言环境。

  // 初始语言
  void initLocale() {
    // 从localStorage拿到信息
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
  }

  // 更改语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  // 切换 theme
  Future<void> switchThemeModel() async {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeTheme(
      _isDarkModel.value == true ? AppTheme.dark : AppTheme.light,
    );
    await Storage().setString(Constants.storageThemeCode,
        _isDarkModel.value == true ? "dark" : "light");
  }

  // 初始 theme
  void initTheme() {
    var themeCode = Storage().getString(Constants.storageThemeCode);
    _isDarkModel.value = themeCode == "dark" ? true : false;
    Get.changeTheme(
      themeCode == "dark" ? AppTheme.dark : AppTheme.light,
    );
  }
}
