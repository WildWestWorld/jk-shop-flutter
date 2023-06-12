import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  // 5 定义 tag 值，唯一即可
  final String tag = '${Get.arguments['id'] ?? ''}${UniqueKey()}';

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _ProductDetailsViewGetX(tag);
  }
}

class _ProductDetailsViewGetX extends GetView<ProductDetailsController> {
  // 1 定义唯一 tag 变量
  final String uniqueTag;

  const _ProductDetailsViewGetX(this.uniqueTag, {Key? key}) : super(key: key);

  // 3 重写 GetView 属性 tag
  @override
  String? get tag => uniqueTag;
  // Tab 栏位按钮
  Widget _buildTabBarItem(String textString, int index) {
    return JKButton.textFilled(
      textString,
      onTap: () => controller.onTapBarTap(index),
      borderRadius: 17,
      textColor: controller.tabIndex == index
          ? AppColors.onPrimary
          : AppColors.secondary,
      bgColor:
          controller.tabIndex == index ? AppColors.primary : Colors.transparent,
    ).tight(
      width: 100.w,
      height: 35.h,
    );
  }

  // 滚动图
  Widget _buildBanner() {
    return GetBuilder<ProductDetailsController>(
        id: "product_banner",
        tag: tag,
        builder: (_) {
          return CarouselWidget(
            // 图片列表
            items: controller.bannerItems,
            // 当前索引
            currentIndex: controller.bannerCurrentIndex,
            // 切换回调
            onPageChanged: controller.onChangeBanner,
            // 高度
            height: 190.w,
            // 指示器圆点
            indicatorCircle: false,
            // 指示器位置
            indicatorAlignment: MainAxisAlignment.start,
            // 指示器颜色
            indicatorColor: AppColors.highlight,

            // 打开大图预览
            onTap: controller.onGalleryTap,
          );
        }).backgroundColor(AppColors.surfaceVariant);
  }

  // 商品标题
  Widget _buildTitle() {
    return <Widget>[
      // 金额、打分、喜欢
      <Widget>[
        // 金额
        JKText.title1(
          "\$${controller.product?.price ?? 0}",
        ).expanded(),
        // 打分
        const JKIconText(
          iconData: Icons.star,
          text: "4.5",
        ).paddingRight(AppSpace.iconTextMedium),
        // 喜欢
        const JKIconText(
          iconData: Icons.favorite,
          text: "100+",
        ),
      ].toRow(),

      // 次标题
      JKText.body1(
        controller.product?.shortDescription?.clearHtml ?? "-",
      ),
    ]
        .toColumn(
          // 左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          // 垂直间距
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .paddingAll(AppSpace.page);
  }

  // Tab 栏位
  Widget _buildTabBar() {
    return GetBuilder<ProductDetailsController>(
      tag: tag,
      id: "product_tab",
      builder: (_) {
        return <Widget>[
          _buildTabBarItem(LocaleKeys.gDetailTabProduct.tr, 0),
          _buildTabBarItem(LocaleKeys.gDetailTabDetails.tr, 1),
          _buildTabBarItem(LocaleKeys.gDetailTabReviews.tr, 2),
        ].toRow(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

  // TabView 视图
  Widget _buildTabView() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 0.w),
        child: TabBarView(
          controller: controller.tabController,
          children: [
            // 规格
            TabProductView(uniqueTag: uniqueTag),
            // 详情
            TabDetailView(uniqueTag: uniqueTag),
            // 评论
            TabReviewsView(uniqueTag: uniqueTag),
          ],
        ),
      ),
    );
  }

  // 底部按钮
  Widget _buildButtons() {
    return <Widget>[
      // 加入购物车
      JKButton.secondary(
        LocaleKeys.gDetailBtnAddCart.tr,
        backgroundColor: Colors.white,
        onTap: controller.onAddCartTap, // 加入购物车事件
      ).expanded(),

      // 间距
      SizedBox(width: AppSpace.iconTextLarge),

      // 立刻购买
      JKButton.primary(
        LocaleKeys.gDetailBtnBuy.tr,
      ).expanded(),
    ]
        .toRow(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        )
        .paddingHorizontal(AppSpace.page);
  }

  // 主视图
  Widget _buildView() {
    return controller.product == null
        ? const PlaceholdWidget() // 占位图
        : <Widget>[
            // 滚动图
            _buildBanner(),

            // 商品标题
            _buildTitle(),

            // Tab 栏位
            _buildTabBar(),

            // TabView 视图
            _buildTabView(),

            _buildButtons().marginOnly(bottom: 10)
          ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(),
      id: "product_details",
      // 4 GetBuilder 属性 tag 设置
      tag: tag,
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          // 导航
          appBar: JKNavgationBar(
              titleString:
                  controller.product?.name ?? LocaleKeys.gDetailTitle.tr),
          // 内容
          body: SafeArea(
            child: <Widget>[
              // // 主视图
              // SmartRefresher(
              //   controller: controller.mainRefreshController, // 刷新控制器
              //   onRefresh: controller.onMainRefresh, // 下拉刷新回调
              //   child: _buildView(),
              // ),

              _buildView(),

              // 底部按钮
              // if (controller.product != null)
              //   _buildButtons().positioned(
              //     left: 0,
              //     bottom: 10,
              //     right: 0,
              //   ),
            ].toStack(),
          ),
        );
      },
    );
  }
}
