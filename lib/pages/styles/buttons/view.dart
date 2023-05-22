import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

import 'index.dart';

class ButtonsPage extends GetView<ButtonsController> {
  const ButtonsPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildButtons(),
        ],
      ).paddingAll(AppSpace.card),
    );
  }

  Widget _buildButtons() {
    return Column(children: [
      // primary 主按钮
      JKButton.primary(
        "主按钮",
        onTap: () {},
      ).paddingOnly(bottom: AppSpace.listRow),

      // secondary 次按钮
      JKButton.secondary(
        "次按钮",
        onTap: () {},
      ).paddingOnly(bottom: AppSpace.listRow),

      // 文字按钮
      JKButton.text(
        "文字按钮",
        textSize: 15,
        onTap: () {},
        // onTap: () async {
        //   await ConfigService.to.switchThemeModel();
        //   controller.update(["buttons"]);
        // },
      ).paddingOnly(bottom: AppSpace.listRow),

      // 图标按钮
      SizedBox(
        width: 30,
        height: 30,
        child: JKButton.icon(
          JKIcon.svg(
            AssetsSvgs.cHomeSvg,
            size: 30,
          ),
          onTap: () {},
        ),
      ).paddingOnly(bottom: AppSpace.listRow),

      // 文字/填充 按钮
      SizedBox(
          height: 30,
          width: 45,
          child: JKButton.textFilled(
            "15",
            bgColor: Get.theme.colorScheme.surfaceVariant.withOpacity(0.5),
            textSize: 12,
            onTap: () {},
          )).paddingOnly(bottom: AppSpace.listRow),

      // 文字/填充/圆形 按钮
      SizedBox(
          height: 24,
          width: 24,
          child: JKButton.textRoundFilled(
            "5",
            bgColor: Get.theme.colorScheme.surfaceVariant.withOpacity(0.4),
            borderRadius: 12,
            textSize: 9,
            onTap: () {},
          )).paddingOnly(bottom: AppSpace.listRow),

      // iconTextUpDown, // 图标/文字/上下
      JKButton.iconTextUpDown(
        JKIcon.svg(
          AssetsSvgs.cHomeSvg,
          size: 30,
        ),
        "Home",
        onTap: () {},
      ).paddingOnly(bottom: AppSpace.listRow),

      // iconTextOutlined, // 图标/文字/边框
      SizedBox(
          width: 100,
          height: 50,

          child: JKButton.iconTextOutlined(
            JKIcon.svg(
              AssetsSvgs.cHomeSvg,
              size: 30,
            ),
            "Home",
            onTap: () {},
          )).paddingOnly(bottom: AppSpace.listRow),

      // iconTextUpDownOutlined, // 图标/文字/上下/边框
      SizedBox(
          height: 50,
          width: 100,
          child: JKButton.iconTextUpDownOutlined(
            JKIcon.svg(
              AssetsSvgs.cHomeSvg,
              size: 30,
            ),
            "Home",
            onTap: () {},
          )).paddingOnly(bottom: AppSpace.listRow),

      // textIcon, // 文字/图标
      JKButton.textIcon(
        "Home",
        JKIcon.svg(
          AssetsSvgs.cHomeSvg,
          size: 30,
        ),
        onTap: () {},
      ).paddingOnly(bottom: AppSpace.listRow),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonsController>(
      init: ButtonsController(),
      id: "buttons",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("buttons")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
