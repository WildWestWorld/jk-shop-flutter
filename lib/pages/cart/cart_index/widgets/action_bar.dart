import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

/// 顶部操作栏
class ActionBar extends StatelessWidget {
  final bool isAll;
  final Function(bool)? onAll;
  final Function()? onRemove;

  const ActionBar({
    Key? key,
    this.onAll,
    this.isAll = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 选择框
      JKCheckBox.all(
        isAll,
        onAll,
        size: 24.sp,
        fontColor: AppColors.highlight,
        label: JKText.body1(
          LocaleKeys.gCartBtnSelectAll.tr,
        ),
      ).expanded(),

      // 删除按钮
      JKButton.icon(
        JKIcon.icon(
          CupertinoIcons.delete,
          size: 20.sp,
        ),
        onTap: onRemove,
      ),
    ].toRow();
  }
}
