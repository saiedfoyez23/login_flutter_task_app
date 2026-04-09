import 'dart:convert';

import 'package:flutter_task_app/model/user_login_response_model.dart';
import 'package:flutter_task_app/utils/app_constant_utils.dart';
import 'package:flutter_task_app/utils/local_storage_utils.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  Rx<UserLoginResponseModel> userLoginResponseModel = UserLoginResponseModel().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(microseconds: 10),() async {
      await userLoginResponse();
    });
  }

  Future<void> userLoginResponse() async {
    print(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse));
    if(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse) != null) {
      userLoginResponseModel.value = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.userLoginResponse)!));
    }
  }


}