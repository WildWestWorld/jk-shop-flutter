import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';
import 'package:jk_shop/common/widgets/JKImageNoInWeb.dart';
import 'package:jk_shop/common/widgets/JKListTile.dart';
import 'package:validatorless/validatorless.dart';

import 'index.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  const ProfileEditPage({Key? key}) : super(key: key);

  // 头像
  Widget _buildAvatar() {
    return JKListTile(
      title: JKText.body1(LocaleKeys.profileEditMyPhoto.tr),
      trailing: [
        !kIsWeb && controller.filePhoto != null
            ? JKImageNoInWeb.file(
                controller.filePhoto?.path ?? "",
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
                radius: 25.w,
              )
            : JKImageNoInWeb.url(
                // UserService.to.profile.avatarUrl,
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201810%2F13%2F20181013234104_hxaco.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1688954210&t=924c89d77494c602e9c5957a47f2e61d",
                width: 50.w,
                height: 50.w,
                fit: BoxFit.cover,
                radius: 25.w,
              ),
      ],
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      onTap: controller.onSelectPhoto,
    )
        .card()
        // .height(90.w)
        .paddingBottom(AppSpace.card);
  }

  //  profile 表单
  Widget _buildProfileForm() {
    return <Widget>[
      // first name
      JKTextForm(
        controller: controller.firstNameController,
        labelText: LocaleKeys.profileEditFirstName.tr,
        validator: Validatorless.multiple([
          Validatorless.required("The field is obligatory"),
          Validatorless.min(
              3, "Length cannot be less than @size".trParams({"size": "3"})),
          Validatorless.max(18,
              "Length cannot be greater than @size".trParams({"size": "18"})),
        ]),
      ),

      // last name
      JKTextForm(
        controller: controller.lastNameController,
        labelText: LocaleKeys.profileEditLastName.tr,
        validator: Validatorless.multiple([
          Validatorless.required("The field is obligatory"),
          Validatorless.min(
              3, "Length cannot be less than @size".trParams({"size": "3"})),
          Validatorless.max(18,
              "Length cannot be greater than @size".trParams({"size": "18"})),
        ]),
      ),

      // Email
      JKTextForm(
        keyboardType: TextInputType.emailAddress,
        controller: controller.emailController,
        labelText: LocaleKeys.profileEditEmail.tr,
        validator: Validatorless.multiple([
          Validatorless.required("The field is obligatory"),
          Validatorless.email(LocaleKeys.validatorEmail.tr),
        ]),
      ),
      // end
    ].toColumn().paddingAll(AppSpace.card).card().paddingBottom(AppSpace.card);
  }

  //  password 表单
  //  password 表单
  Widget _buildPasswordForm() {
    return <Widget>[
      // old password
      JKTextForm(
        isObscure: true,
        keyboardType: TextInputType.visiblePassword,
        controller: controller.oldPasswordController,
        labelText: LocaleKeys.profileEditOldPassword.tr,
        hintText: LocaleKeys.profileEditPasswordTip.tr,
        validator: Validatorless.multiple([
          Validatorless.min(
              3, "Length cannot be less than @size".trParams({"size": "3"})),
          Validatorless.max(18,
              "Length cannot be greater than @size".trParams({"size": "18"})),
        ]),
      ),

      // new password
      JKTextForm(
        isObscure: true,
        keyboardType: TextInputType.visiblePassword,
        controller: controller.newPasswordController,
        labelText: LocaleKeys.profileEditNewPassword.tr,
        hintText: LocaleKeys.profileEditPasswordTip.tr,
        validator: Validatorless.multiple([
          Validatorless.min(
              3, "Length cannot be less than @size".trParams({"size": "3"})),
          Validatorless.max(18,
              "Length cannot be greater than @size".trParams({"size": "18"})),
        ]),
      ),

      // confirm password
      JKTextForm(
        isObscure: true,
        keyboardType: TextInputType.visiblePassword,
        controller: controller.confirmNewPasswordController,
        labelText: LocaleKeys.profileEditConfirmPassword.tr,
        hintText: LocaleKeys.profileEditPasswordTip.tr,
        validator: Validatorless.multiple([
          Validatorless.min(
              3, "Length cannot be less than @size".trParams({"size": "3"})),
          Validatorless.max(18,
              "Length cannot be greater than @size".trParams({"size": "18"})),
        ]),
      ),

      // end
    ].toColumn().paddingAll(AppSpace.card).card();
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 头像
        _buildAvatar(),

        // 表单
        Form(
          key: controller.formKey, //设置globalKey，用于后面获取FormState
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: <Widget>[
            // profile 表单
            _buildProfileForm(),
            // password 表单
            _buildPasswordForm(),
          ].toColumn(),
        ).paddingBottom(AppSpace.card),

        // 保存按钮
        JKButton.primary(
          LocaleKeys.commonBottomSave.tr,
          onTap: controller.onSave, // 保存 tap 事件
          height: AppSpace.buttonHeight,
        ).paddingHorizontal(AppSpace.page),
      ].toColumn().padding(
            top: 45.h,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileEditController>(
      init: ProfileEditController(),
      id: "profile_edit",
      builder: (_) {
        return Scaffold(
          appBar: JKNavgationBar(titleString: LocaleKeys.profileEditTitle.tr),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
