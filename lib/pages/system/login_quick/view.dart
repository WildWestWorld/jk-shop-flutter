import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

import 'index.dart';

class LoginQuickPage extends GetView<LoginQuickController> {
  const LoginQuickPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // logo
      <Widget>[
        JKImage.asset(
          AssetsImages.logoPng,
          width: 60,
          height: 57,
        ).paddingBottom(22),
        // 标题1
        JKText(
          text: "Let's Sign You In",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.onPrimary,
          ),
        ).paddingBottom(10),
        // 标题2
        JKText(
          text: "Welcome back,you've been missed!",
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.onPrimary),
        ).paddingBottom(55),
      ].toColumn(),

      //表单

      <Widget>[
        // username
        const JKText(
            text: "Username or E-Mail",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xff838383),
            )).paddingBottom(AppSpace.listRow),
        // usernameInput
        JKInput.iconTextFilled(JKIcon.icon(Icons.person)).paddingBottom(29),
        // password
        const JKText(
            text: "Password",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xff838383),
            )).paddingBottom(AppSpace.listRow),
        // passwordInput
        JKInput.iconTextFilled(JKIcon.icon(Icons.lock_outline))
            .paddingBottom(AppSpace.listRow * 2),
        // 登录按钮
        JKButton.primary(
          "Sign in",
          backgroundColor: Color(0xffFD8700),
        ).tight(width: double.infinity, height: 57).paddingBottom(20),
        // 注册
        <Widget>[
          //文字
          const JKText(
              text: "Don't have an account?",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xff838383),
              )).paddingRight(AppSpace.listItem),
          //注册按钮
          JKButton.text(
            "Sign Up",
            textColor: const Color(0xff0274BC),
            textWeight: FontWeight.bold,
            borderRadius: 18,
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.center)
      ]
          .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
          .paddingAll(20)
          .card(color: Colors.white,borderRadius: 35),
    ]
        .toColumn(mainAxisAlignment: MainAxisAlignment.center)
        .paddingHorizontal(15);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginQuickController>(
      init: LoginQuickController(),
      id: "login_quick",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xff0274BC),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
