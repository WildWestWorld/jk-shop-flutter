import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

import 'index.dart';

class BuyNowPage extends GetView<BuyNowController> {
  const BuyNowPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  // 商品数据
  final ProductModel product;
  // 标题
  Widget _buildTitle(String text) {
    return JKText.title2(text).paddingBottom(AppSpace.listRow);
  }

  // 支付方式
  Widget _buildPayment() {
    return List<Widget>.generate(
      controller.paymentList.length,
      (index) => JKImage.asset(
        controller.paymentList[index],
        width: 106.w,
        height: 50.w,
        backgroundColor: AppColors.surface,
      )
          .decorated(
            border: Border.all(
              color: AppColors.surfaceVariant,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(AppRadius.button)),
          )
          .paddingRight(AppSpace.iconTextSmail),
    )
        .toList()
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(50.w)
        .paddingBottom(AppSpace.listRow);
  }

  // 底部按钮
  Widget _buildButtons() {
    return <Widget>[
      // 取消
      JKButton.secondary(
        LocaleKeys.commonBottomCancel.tr,
        onTap: () => Get.back(),
      ).expanded(),

      // 间距
      SizedBox(width: AppSpace.iconTextLarge),

      // 立刻购买 Place Order
      JKButton.primary(
        LocaleKeys.placeOrderBtnPlaceOrder.tr,
        onTap: controller.onCheckout,
      ).expanded(),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  // 送货地址
  Widget _buildShipping() {
    return <Widget>[
      // 文字
      JKText.body1(controller.shippingAddress).expanded(),

      // 图标
      JKIcon.icon(
        Icons.arrow_drop_down,
        size: 32,
      ),
    ]
        .toRow()
        .paddingAll(AppSpace.button)
        .decorated(
          color: AppColors.surfaceVariant,
          border: Border.all(
            color: AppColors.outline,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(AppRadius.button),
        )
        .onTap(controller.onShippingTap)
        .paddingBottom(AppSpace.listRow);
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 支付方式
      _buildTitle(LocaleKeys.placeOrderPayment.tr),
      _buildPayment(),

      // 送货地址
      _buildTitle(LocaleKeys.placeOrderShippingAddress.tr),
      _buildShipping(),

      // 数量
      _buildTitle(LocaleKeys.placeOrderQuantity.tr),

      // 小计
      _buildTitle(LocaleKeys.placeOrderPrice.tr),

      // 按钮
      _buildButtons(),

      // end
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .paddingAll(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BuyNowController>(
      init: BuyNowController(product),
      id: "buy_now",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
