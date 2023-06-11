import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../index.dart';

/// 下拉菜单
class DropdownWidget extends StatelessWidget {
  /// 点击菜单
  final Function(KeyValueModel? val)? onChanged;

  /// 数据项列表
  final List<KeyValueModel>? items;

  /// 选中数据值
  final KeyValueModel? selectedValue;

  /// 提示文字
  final String? hintText;

  /// 图标颜色
  final Color? iconColor;

  /// 按钮 padding
  final EdgeInsetsGeometry? buttonPadding;

  const DropdownWidget({
    Key? key,
    this.items,
    this.selectedValue,
    this.hintText,
    this.onChanged,
    this.buttonPadding,
    this.iconColor,
  }) : super(key: key);

  Widget _buildView() {
    final focusNode = FocusNode();

    final overlayColor = MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // if (states.contains(MaterialState.focused)) {
        //   // 设置聚焦状态下的覆盖颜色
        //   return Colors.transparent;
        // }
        // if (states.contains(MaterialState.hovered)) {
        //   // 设置悬停状态下的覆盖颜色
        //   return Colors.transparent;
        // }
        // if (states.contains(MaterialState.pressed)) {
        //   // 设置按下状态下的覆盖颜色
        //   return Colors.transparent;
        // }
        // 默认颜色
        return null;
      },
    );

    return DropdownButtonHideUnderline(
      child: DropdownButton2<KeyValueModel>(
          focusNode: focusNode,

          // 扩展
          isExpanded: true,
          // 提示组件
          hint: Row(
            children: [
              Expanded(
                child: JKText.body1(hintText ?? 'Select Item'),
              ),
            ],
          ),
          // 下拉项列表
          items: items
              ?.map((item) => DropdownMenuItem<KeyValueModel>(
                    value: item,
                    child: JKText.body1(item.value),
                  ))
              .toList(),
          // 选中项
          value: selectedValue,
          // 改变事件
          onChanged: onChanged,
          onMenuStateChange: (isOpen) {
            print(isOpen);
            if (!isOpen) {
              focusNode.unfocus();
            }
          },
          iconStyleData: IconStyleData(
            icon: JKIcon.icon(
              Icons.expand_more,
              color: iconColor ?? AppColors.primary,
            ),
          ),
          buttonStyleData: ButtonStyleData(
            overlayColor: overlayColor,
            // 必须写这个颜色 不然就有Force BUG
            decoration: const BoxDecoration(color: Colors.transparent),
            // 按钮 padding
            padding: buttonPadding ??
                EdgeInsets.symmetric(horizontal: AppSpace.iconTextSmail),
          ),
          dropdownStyleData: const DropdownStyleData(
            // 偏移
            offset: Offset(0, 0),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
