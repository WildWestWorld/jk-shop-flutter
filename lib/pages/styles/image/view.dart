import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';
import 'package:jk_shop/common/widgets/JKImageNoInWeb.dart';

import 'index.dart';

class ImagePage extends GetView<ImageController> {
  const ImagePage({Key? key}) : super(key: key);

  Widget _buildView() {
    return ListView(
      children: [
        const ListTile(
          leading: kIsWeb
              ? JKImage.url(
                  "https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/90bb74497f090c48e1df1ec1ca31fb11-450x450.jpg")
              : JKImageNoInWeb.url(
                  "https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/90bb74497f090c48e1df1ec1ca31fb11-450x450.jpg"),
          title: JKText.body1("ImageWidget.url"),
        ),
        ListTile(
          leading: kIsWeb
              ? JKImage.asset(AssetsImages.pPaypalPng)
              : JKImageNoInWeb.asset(AssetsImages.pPaypalPng),
          title: const JKText.body1("ImageWidget.asset"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageController>(
      init: ImageController(),
      id: "image",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("image")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
