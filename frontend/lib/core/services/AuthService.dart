import 'package:frontend/core/services/ApiService.dart';
import 'package:frontend/core/services/SendEmailVerificationDto.dart';
import 'package:frontend/core/services/user_verification_code_result.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/model/CheckVerificationCodeDto.dart';
import 'package:frontend/model/authentication_dto.dart';
import 'package:frontend/model/login.dart';
import 'package:frontend/model/sigin_up.dart';

class AuthService {
  ApiService apiService = locator<ApiService>();
  AuthService();

  Future<UserVerificationCodeResult> sendEmailVerificationCode(
      SendEmailVerificationDto sendEmailVerificationDto) async {
    var jsonMap = await apiService.post(
        "Authentication/SendEmailVerificationCode",
        sendEmailVerificationDto.toJson());
    var result = UserVerificationCodeResult.fromJson(jsonMap);
    return result;
  }

  Future<bool> checkEmailVerificationCode(
      CheckVerificationCodeDto checkVerificationCodeDto) async {
    var jsonMap = await apiService.postDynamic(
        "Authentication/CheckEmailVerificationCode",
        checkVerificationCodeDto.toJson());
    print(jsonMap);
    return jsonMap;
  }

  Future<AuthenticationDto> SiginUp(SiginUpDto signUpDto) async {
    var jsonMap =
        await apiService.post("Authentication/SiginUp", signUpDto.toJson());
    var result = AuthenticationDto.fromJson(jsonMap);
    return result;
  }

  Future<AuthenticationDto> login(LoginDto login) async {
    var jsonMap = await apiService.post("Authentication/Login", login.toJson());
    var result = AuthenticationDto.fromJson(jsonMap);
    return result;
  }
}
