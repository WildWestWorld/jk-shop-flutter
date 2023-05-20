import 'package:get/get.dart';
import 'package:jk_shop/common/index.dart';

class StylesIndexController extends GetxController {
  StylesIndexController();

  _initData() {
    update(["styles_index"]);
  }

  void onTap() {}

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

  // 多语言
  // 切换语言
  onLanguageSelected() {
    var en = Translation.supportedLocales[0];
    var zh = Translation.supportedLocales[1];


    //Local对象.toLanguageTag()  作用是 Local对象 转换成string 
    // 如果当前对象是 EN 就把对象转成ZH  
    //就是变相的切换语言
    var local =  ConfigService.to.locale.toLanguageTag() == en.toLanguageTag() ? zh : en;
      

    // 调用ConfigService的语言更新
    ConfigService.to.onLocaleUpdate(local);
    // 更新View
    update(["styles_index"]);
  }


  // 切换主题
  onThemeSelected() async {
    await ConfigService.to.switchThemeModel();
    update(["styles_index"]);
  }
}
