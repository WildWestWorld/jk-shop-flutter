import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';
import 'package:jk_shop/pages/index.dart';

import 'index.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    DateTime? _lastPressedAt;
    return WillPopScope(
      // 防止连续点击两次退出
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) >
                const Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          Loading.toast('Press again to exit');
          return false;
        }
        // SystemChannels.platform.invokeMethod  调用原生退出
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        // 导航栏
        bottomNavigationBar: GetBuilder<MainController>(
          id: 'navigation',
          builder: (controller) {
            return Obx(() => JKAppBar(
                  currentIndex: controller.currentIndex,
                  items: [
                    NavigationItemModel(
                      label: LocaleKeys.tabBarHome.tr,
                      icon: AssetsSvgs.navHomeSvg,
                    ),
                    NavigationItemModel(
                      label: LocaleKeys.tabBarCart.tr,
                      icon: AssetsSvgs.navCartSvg,
                      // 购物车数量
                      count: CartService.to.lineItemsCount,
                    ),
                    NavigationItemModel(
                      label: LocaleKeys.tabBarMessage.tr,
                      icon: AssetsSvgs.navMessageSvg,
                      count: 9,
                    ),
                    NavigationItemModel(
                      label: LocaleKeys.tabBarProfile.tr,
                      icon: AssetsSvgs.navProfileSvg,
                    ),
                  ],
                  onTap: controller.onJumpToPage, // 切换tab事件
                ));
          },
        ),
        // 内容页
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: controller.onIndexChanged,
          children: const [
            HomePage(),
            CartIndexPage(),
            MsgIndexPage(),
            MyIndexPage(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      // init: Get.find<MainController>(),
      id: "main",
      builder: (_) => _buildView(),
    );
  }
}
