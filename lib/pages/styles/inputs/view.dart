import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

import 'index.dart';

class InputsPage extends GetView<InputsController> {
  const InputsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(child: Center(child: _buildInputs()));
  }

  Widget _buildInputs() {
    return Column(
      children: <Widget>[
        /// 文本
        const SizedBox(
            width: 300,
            child: JKInput.text(
              hintText: "文本",
            )).paddingOnly(bottom: AppSpace.listRow),

        const SizedBox(
            width: 300,
            child: JKInput.textBorder(
              hintText: "文本/边框",
            )).paddingOnly(bottom: AppSpace.listRow),
        SizedBox(
            width: 300,
            child: JKInput.textFilled(
              hintText: "文本/填充/边框",
            )).paddingOnly(bottom: AppSpace.listRow),

        SizedBox(
            width: 300,
            child: JKInput.iconTextFilled(
              JKIcon.svg(
                AssetsSvgs.cHomeSvg,
              ),
              hintText: "图标/文本/填充/边框",
            )).paddingOnly(bottom: AppSpace.listRow),

        /// 后缀图标/文本/填充/边框
        SizedBox(
            width: 300,
            child: JKInput.suffixTextFilled(
              JKIcon.svg(
                AssetsSvgs.cHomeSvg,
              ),
              hintText: "后缀图标/文本/填充/边框",
            )).paddingOnly(bottom: AppSpace.listRow),

        SizedBox(
            width: 300,
            child: JKInput.search(
              hintText: "搜索",
            )).paddingOnly(bottom: AppSpace.listRow),

        /// 选择框
        JKCheckBox(
          value: controller.checkVal,
          onChanged: controller.onCheckBox,
        ).width(300).paddingBottom(AppSpace.listRow),

        /// 选择框 all
        JKCheckBox.all(
          controller.checkVal,
          controller.onCheckBox,
          label: const JKText.title3("全选"),
        ).width(300).paddingBottom(AppSpace.listRow),

        /// 选择框 single
        JKCheckBox.single(
          controller.checkVal,
          controller.onCheckBox,
          label: const JKText.title3("行选择"),
        ).width(300).paddingBottom(AppSpace.listRow),

        /// 选择框 radio
        JKCheckBox.radio(
          controller.checkVal,
          controller.onCheckBox,
          label: const JKText.body1("radio"),
        ).width(300).paddingBottom(AppSpace.listRow),

        // end
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputsController>(
      init: InputsController(),
      id: "inputs",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("inputs")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
