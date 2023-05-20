import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';
import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(children: [
      ListTile(
        onTap: controller.onLanguageSelected,
        title: Text(
          "语言 : ${ConfigService.to.locale.toLanguageTag()}",
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      id: "styles_index",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("styles_index")),

          // tr会自动去转换对应的版本的文字
          // LocaleKeys.XXX 其实是设定的键名
          //getX会根据对应的键名拿到对应的数据 然后由tr 根据语言自动转换
          appBar: AppBar(title: Text(LocaleKeys.stylesTitle.tr)),

          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
