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
      ListTile(
        onTap: controller.onThemeSelected,
        title: Text("主题 : ${ConfigService.to.isDarkModel ? "Dark" : "Light"}"),
      ),
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesText),
        title: const Text("Text 文本"),
      ),
// Icon 图标
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesIcon),
        title: const Text("Icon 图标"),
      ),
      // Image 图片
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesImage),
        title: const Text("Image 图片"),
      ),

      // Button 按钮
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesButtons),
        title: const Text("Button 按钮"),
      ),
      // Input 输入框
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesInputs),
        title: const Text("Input 输入框"),
      ),
      // form 表单
      ListTile(
        onTap: () => Get.toNamed(RouteNames.stylesTextForm),
        title: const Text("form 表单"),
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
