import 'package:jk_shop/common/index.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await ApiOrginService.to.post(
      '/users/register',
      data: req,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<UserTokenModel> login(UserLoginReq? req) async {
    var res = await ApiOrginService.to.post(
      '/users/login',
      data: req,
    );
    return UserTokenModel.fromJson(res.data);
  }

  /// Profile
  static Future<UserProfileModel> profile() async {
    var res = await ApiOrginService.to.get(
      '/users/me',
    );
    return UserProfileModel.fromJson(res.data);
  }
}
