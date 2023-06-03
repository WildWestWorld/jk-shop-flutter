// 存储用户 个人配置
/// 常量
class Constants {
  // 本地存储key
  //storageLanguageCode 存储当前语言的键名
  static const storageLanguageCode = 'language_code';

// storageThemeCode 存储主题色
  static const storageThemeCode = 'theme_code';

  static const storageAlreadyOpen = 'already_open'; // 首次打开

  // wp 服务器
  static const wpApiBaseUrl = 'https://wpapi.ducafecat.tech';

  // 用户登录
  static const storageToken = 'token'; // 登录成功后 token
  static const storageProfile = 'profile'; // 用户资料缓存
}