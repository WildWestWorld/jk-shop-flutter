import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';
import 'package:jk_shop/pages/index.dart';

class FilterView extends GetView<SearchFilterController> {
  const FilterView({Key? key}) : super(key: key);
// 顶部 关闭
  Widget _buildTopBar() {
    return <Widget>[
      // 文字
      JKText.title3(LocaleKeys.searchFilter.tr),

      // 关闭按钮
      JKButton.icon(
        JKIcon.icon(
          Icons.close,
          size: 15,
          color: AppColors.secondary,
        ),
        onTap: controller.onFilterCloseTap,
      )
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .paddingBottom(AppSpace.listRow);
  }

  Widget _buildView() {
    return <Widget>[
      // 顶部
      _buildTopBar(),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .paddingHorizontal(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      id: "filter_view",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
