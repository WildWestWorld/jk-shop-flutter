import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // FLUTTER与原生的接口 进行初始化避免报错，！必须放前面
    WidgetsFlutterBinding.ensureInitialized();

    //   它使用 Get.putAsync() 方法将 ConfigService 类以异步的方式放到 Get 包内存中，以便获取单例实例。
    //   使用 await 等待该操作完成之后，可在 whenComplete() 方法中执行一些额外的逻辑。
    // Global 类通常用于定义全局变量和方法，以便在整个应用程序中调用。
    // 在这个例子中， Global.init() 方法是在应用程序启动时调用的，
    // 以确保所有需要的服务和变量都被正确地初始化，因此非常重要。

// Get.putAsync 是 Get 包中提供的一个方法，用于将一个异步函数返回的对象作为单例实例放入内存中，从而可以在整个应用程序中方便地访问它。
//  Get.putAsync 方法可以在需要的时候获取和创建服务实例，而不会阻塞UI线程。
//  在这个例子中， Get.putAsync<ConfigService>() 方法是在 Global 类的 init() 方法中异步调用的，
//  它将 ConfigService() 实例放入内存中，以便在整个应用程序中都可访问 ConfigService 的单例实例
//  。因为 ConfigService 是继承自 GetxService 的类，所以它会被自动转化为一个单例服务。
//   Get.putAsync 方法返回一个 Future 对象，当 Future 对象完成时，会自动将返回值传递给 Get.putAsync 方法，并使用该值创建单例实例。
//   如果返回值是同步的，则使用 Get.put() 方法来创建单例实例。

// Future.wait() 是Dart中 Future 类提供的一个方法，它可以在同时触发多个异步操作时，等待所有操作都完成，并返回所有异步操作的结果。
//   Future.wait() 接受一个 List<Future> 类型的参数，表示需要等待的一组异步操作。
//   当所有异步操作都执行完毕时， Future.wait() 方法将以一个新的 Future<List> 对象的形式返回所有异步操作的结果，该结果以对应的结果列表的顺序排列。
//  在这个例子中， await Future.wait() 方法被用来等待 Get.putAsync<ConfigService>() 方法完成，并将其放入一个 List 中等待。
//  因为 Get.putAsync<ConfigService>() 方法返回的是一个 Future 对象，而且它是异步执行的，所以需要使用 await 关键字等待它执行完成。
//  由于 Future.wait() 方法可能会等待多个异步操作，因此我们可以将它们放入一个 List 中，以便在需要的时候等待它们全部完成



    await Future.wait([
      //初始化包管理 服务
      Get.putAsync<ConfigService>(() async {
        return await ConfigService().init();
      }),
     //初始化localStorage
     Storage().init(),
    ]).whenComplete(() {});
  }
}
