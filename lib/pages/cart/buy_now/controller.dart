import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

class BuyNowController extends GetxController {
  BuyNowController(ProductModel product);

  // 支付方式图标
  List<String> paymentList = [
    AssetsImages.pVisaPng,
    AssetsImages.pCashPng,
    AssetsImages.pMastercardPng,
    AssetsImages.pPaypalPng,
  ];

  _initData() {
    update(["buy_now"]);
  }

  void onTap() {}
  // 下单 checkout
  void onCheckout() async {}
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
