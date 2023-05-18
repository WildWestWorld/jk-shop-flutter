import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';



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
  // Get.find 会获取到当前文件的实例 不继承 GetxService无法使用
  static ConfigService get instance => Get.find();

  PackageInfo? _platform;
  // 获取到_platform里面的版本
  String get version => _platform?.version ?? '-';

  // 初始化
  Future<ConfigService> init() async {
    // 获取系统依赖包的创建的实例
    await getPlatform();
    return this;
  }
  
    // 获取系统依赖包的创建的实例
  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }
}