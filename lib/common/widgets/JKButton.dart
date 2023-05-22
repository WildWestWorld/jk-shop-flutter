import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';

enum JKButtonType {
  none, // 无
  primary, // 主按钮
  secondary, // 次按钮
  text, // 文字按钮
  icon, // 图标按钮
  textFilled, // 文字/填充
  textRoundFilled, // 文字/填充/圆形
  iconTextUpDown, // 图标/文字/上下
  iconTextOutlined, // 图标/文字/边框
  iconTextUpDownOutlined, // 图标/文字/上下/边框
  textIcon, // 文字/图标
}

/// 按钮
class JKButton extends StatelessWidget {
  /// 按钮类型
  final JKButtonType type;

  /// tap 事件
  final Function()? onTap;

  /// 文字字符串
  final String? text;

  /// 子组件
  final Widget? child;

  /// 图标
  final Widget? icon;

  /// 圆角
  final double? borderRadius;

  /// 背景色
  final Color? backgroundColor;

  /// 边框色
  final Color? borderColor;

  /// 宽度
  final double? width;

  /// 高度
  final double? height;

  const JKButton({
    Key? key,
    this.type = JKButtonType.none,
    this.onTap,
    this.text,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  }) : super(key: key);

  /// 主要
  const JKButton.primary(
    this.text, {
    Key? key,
    this.type = JKButtonType.primary,
    this.width = double.infinity,
    this.height = 50,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
  }) : super(key: key);

  /// 次要
  const JKButton.secondary(
    this.text, {
    Key? key,
    this.type = JKButtonType.secondary,
    this.width = double.infinity,
    this.height = 50,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
  }) : super(key: key);

  /// 文字
  JKButton.text(
    this.text, {
    Key? key,
    this.type = JKButtonType.text,
    this.onTap,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.borderRadius,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  })  : child = JKText.button(
          text: text!,
          size: textSize,
          color: textColor ?? AppColors.onPrimaryContainer,
          weight: textWeight,
        ),
        super(key: key);

  /// 图标
  const JKButton.icon(
    this.icon, {
    Key? key,
    this.type = JKButtonType.icon,
    this.onTap,
    this.text,
    this.borderRadius,
    this.backgroundColor,
    this.child,
    this.borderColor,
    this.width,
    this.height,
  }) : super(key: key);

  /// 文字/填充
  JKButton.textFilled(
    this.text, {
    Key? key,
    this.type = JKButtonType.textFilled,
    Color? bgColor,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.onTap,
    this.borderRadius,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  })  : backgroundColor = bgColor ?? AppColors.primary,
        child = JKText.button(
          text: text!,
          size: textSize,
          color: textColor ?? AppColors.onPrimaryContainer,
          weight: textWeight,
        ),
        super(key: key);

  /// 文字/填充/圆形 按钮
  JKButton.textRoundFilled(
    this.text, {
    Key? key,
    this.type = JKButtonType.textRoundFilled,
    Color? bgColor,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.onTap,
    this.borderRadius,
    this.icon,
    this.borderColor,
    this.width,
    this.height,
  })  : backgroundColor = bgColor ?? AppColors.primary,
        child = JKText.button(
          text: text!,
          size: textSize,
          color: textColor ?? AppColors.onPrimaryContainer,
          weight: textWeight,
        ),
        super(key: key);

  /// 图标文字 上下
  JKButton.iconTextUpDown(
    this.icon,
    this.text, {
    Key? key,
    this.type = JKButtonType.iconTextUpDown,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  })  : child = Column(mainAxisSize: MainAxisSize.min, children: [
          icon!,
          JKText.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ),
        ]),
        super(key: key);

  /// 图标 / 文字 / 边框
  JKButton.iconTextOutlined(
    this.icon,
    this.text, {
    Key? key,
    this.type = JKButtonType.iconTextOutlined,
    this.onTap,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  })  : child = Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: EdgeInsets.only(right: AppSpace.iconTextSmail),
              child: icon),
          JKText.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          )
        ]),
        super(key: key);

  /// 图标 / 文字 / 上下 / 边框
  JKButton.iconTextUpDownOutlined(
    this.icon,
    this.text, {
    Key? key,
    this.type = JKButtonType.iconTextUpDownOutlined,
    this.onTap,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  })  : child = Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: EdgeInsets.only(right: AppSpace.iconTextSmail),
              child: icon),
          JKText.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          )
        ]),
        super(key: key);

  /// 文字 / 图标
  JKButton.textIcon(
    this.text,
    this.icon, {
    Key? key,
    Color? textColor,
    double? textSize,
    FontWeight? textWeight,
    this.type = JKButtonType.textIcon,
    this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  })  : child = Row(mainAxisSize: MainAxisSize.min, children: [
          Padding(padding: EdgeInsets.only(right: AppSpace.iconTextSmail)),
          JKText.button(
            text: text!,
            size: textSize,
            color: textColor ?? AppColors.onPrimaryContainer,
            weight: textWeight,
          ),
          icon!,
        ]),
        super(key: key);

  // 背景
  MaterialStateProperty<Color?>? get _backgroundColor {
    switch (type) {
      case JKButtonType.primary:
        return MaterialStateProperty.all(backgroundColor ?? AppColors.primary);
      default:
        return MaterialStateProperty.all(backgroundColor ?? Colors.transparent);
    }
  }

  // 边框
  MaterialStateProperty<BorderSide?>? get _side {
    switch (type) {
      case JKButtonType.secondary:
        return MaterialStateProperty.all(BorderSide(
          color: borderColor ?? AppColors.primary,
          width: 1,
        ));
      case JKButtonType.iconTextOutlined:
      case JKButtonType.iconTextUpDownOutlined:
        return MaterialStateProperty.all(BorderSide(
          color: borderColor ?? AppColors.outline,
          width: 1,
        ));
      default:
        return null;
    }
  }

  // 阴影颜色
  MaterialStateProperty<Color?>? get _overlayColor {
    switch (type) {
      case JKButtonType.primary:
        return null;
      default:
        return MaterialStateProperty.all(AppColors.surfaceVariant);
    }
  }

  // 形状圆角
  MaterialStateProperty<OutlinedBorder?>? get _shape {
    switch (type) {
      case JKButtonType.primary:
      case JKButtonType.secondary:
        return MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? AppRadius.button)),
          ),
        );
      case JKButtonType.textFilled:
      case JKButtonType.iconTextOutlined:
      case JKButtonType.iconTextUpDownOutlined:
        return MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? AppRadius.buttonTextFilled)),
          ),
        );
      case JKButtonType.textRoundFilled:
        return MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
          ),
        );
      default:
        return null;
    }
  }

  // padding
  MaterialStateProperty<EdgeInsetsGeometry?>? get _padding {
    switch (type) {
      // case JKButtonType.primary:
      // case JKButtonType.secondary:
      //   return null;
      default:
        return MaterialStateProperty.all(EdgeInsets.zero);
    }
  }

  // 子元素
  Widget? get _child {
    switch (type) {
      case JKButtonType.primary:
        return JKText.button(
          text: text!,
          color: AppColors.onPrimary,
        );
      case JKButtonType.secondary:
        return JKText.button(
          text: text!,
          color: AppColors.primary,
        );
      case JKButtonType.icon:
        return icon;
      default:
        return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        child: _child,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(0, 0)),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: _backgroundColor,
          side: _side,
          overlayColor: _overlayColor,
          shape: _shape,
          padding: _padding,
        ),
      ),
    );
  }
}
