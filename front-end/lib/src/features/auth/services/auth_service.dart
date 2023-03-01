import '../../../constants/controllers.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import '../../../Api/api_service.dart';

class AuthServices {
  static login({required username, required password}) async {
    LoginModel loginModel =
        LoginModel(username: username.text, password: password.text);
    var res =
        await ApiHandler.post(loginModelToJson(loginModel), "login", null, "");
    return res;
  }

  static register(
      {required username,
      required password,
      required firstName,
      required lastName,
      required email}) async {
    RegisterModel registerModel = RegisterModel(
      username: username.text,
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
      password: password.text,
      jobTitle: "Nhà Môi Giới",
      lastLoginDate: appController.now,
      created: appController.now,
      updated: appController.now,
    );

    var res = await ApiHandler.post(
        registerModelToJson(registerModel),
        "register",
        {
          "agency_id": registerController.agencyValue == 0
              ? "1"
              : registerController.agencyValue.toString()
        },
        "");
    return res;
  }
}
