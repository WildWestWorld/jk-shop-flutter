import 'package:flutter/material.dart';
import 'package:jk_shop/common/index.dart';

/// 小计项
class BuildTotalItem extends StatelessWidget {
  const BuildTotalItem({
    Key? key,
    this.title,
    this.price,
    this.currencySymbol,
  }) : super(key: key);

  /// 标题
  final String? title;

  /// 价格
  final String? price;

  /// 货币符号
  final String? currencySymbol;

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // title
      JKText.body1(title ?? "").expanded(),

      // price
      JKText.body2("$currencySymbol $price"),
    ].toRow();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
