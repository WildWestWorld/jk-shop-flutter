import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

/// 订单列表项
class BuildOrderListItem extends StatelessWidget {
  const BuildOrderListItem({Key? key, required this.item}) : super(key: key);

  final OrderModel item;

  // 标签
  Widget _buildTag(String tag) {
    return JKButton.primary(
      tag,
    ).tight(
      width: 100.w,
      height: 32.w,
    );
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // id tag
      <Widget>[
        // 编号
        JKText.body1("# ${item.id}").expanded(),

        // 标签tag
        _buildTag(item.status ?? "-"),
      ].toRow().paddingBottom(AppSpace.listRow),

      // orderKey date
      <Widget>[
        // 订单号
        JKText.body1("${item.orderKey}").expanded(),

        // 日期
        JKText.body2("${item.dateCreated}".dateFormatOfyyyyMMdd),
      ].toRow(),
    ].toColumn().paddingAll(AppSpace.card).card();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
