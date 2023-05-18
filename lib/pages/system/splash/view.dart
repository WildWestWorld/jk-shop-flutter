import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return  Center(
      child: Text("SplashPage - ${ConfigService.instance.version}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>( 
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("splash"),centerTitle: true,),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
