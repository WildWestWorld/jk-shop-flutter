import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

import 'index.dart';

class ApplyPromoCodePage extends GetView<ApplyPromoCodeController> {
  const ApplyPromoCodePage({
    Key? key,
    required this.onApplyCouponCode,
  }) : super(key: key);

  // 应用优惠券
  final Function(String) onApplyCouponCode;

  // 底部按钮
  Widget _buildButtons() {
    return <Widget>[
      // cancel
      JKButton.text(
        LocaleKeys.commonBottomCancel.tr,
        onTap: () => Get.back(),
      ).marginOnly(right: 5),

      // apply
      JKButton.text(
        LocaleKeys.commonBottomApply.tr,
        // 确认优惠券输入
        onTap: () {
          // 回调函数
          onApplyCouponCode(controller.couponController.text);
          Get.back();
        },
        textColor: AppColors.highlight,
        textWeight: FontWeight.w500,
      ),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 标题
      JKText.title3(LocaleKeys.promoCode.tr).paddingBottom(AppSpace.listRow),

      // 说明
      JKText.body2(
        LocaleKeys.promoDesc.tr,
        maxLines: 3,
        softWrap: true,
      ).paddingBottom(AppSpace.listRow),

      // 输入优惠券
      JKInput.textBorder(
        controller: controller.couponController,
        hintText: LocaleKeys.promoEnterCodeTip.tr,
      ).paddingBottom(AppSpace.listRow),

      // 按钮
      _buildButtons(),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .paddingAll(40)
        .backgroundColor(AppColors.background);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplyPromoCodeController>(
      init: ApplyPromoCodeController(),
      id: "apply_promo_code",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
