import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';
import 'index.dart';

class IconPage extends GetView<IconController> {
  const IconPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return ListView(
      children: [
        ListTile(
          leading: JKIcon.icon(Icons.home),
          title: const JKText.body1("JKIcon.icon"),
        ),
        ListTile(
          leading: JKIcon.image(AssetsImages.defaultPng),
          title: const JKText.body1("JKIcon.image"),
        ),
        ListTile(
          leading: JKIcon.svg(AssetsSvgs.cHomeSvg),
          title: const JKText.body1("JKIcon.svg"),
        ),
        ListTile(
          leading: JKIcon.url(
              "https://ducafecat.oss-cn-beijing.aliyuncs.com/flutter_woo_commerce_getx_ducafecat/categories/c-man.png"),
          title: const JKText.body1("JKIcon.url"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IconController>(
      init: IconController(),
      id: "icon",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("icon")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
