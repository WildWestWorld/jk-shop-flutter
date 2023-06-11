import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jk_shop/common/index.dart';

/// 功能栏项
class BarItemWidget extends StatelessWidget {
  final String title;
  final String svgPath;

  const BarItemWidget({
    Key? key,
    required this.title,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 图标
      JKIcon.svg(
        svgPath,
        size: 24.sp,
        color: AppColors.primary,
      ).paddingBottom(AppSpace.iconTextSmail),

      // 标题
      JKText.body2(
        title,
      ),
    ].toColumn();
  }
}
