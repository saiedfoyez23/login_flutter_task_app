import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_task_app/screen/home_screen.dart';
import 'package:flutter_task_app/utils/api_utils.dart';
import 'package:flutter_task_app/utils/app_constant_utils.dart' show AppConstantUtils;
import 'package:flutter_task_app/utils/base_api_utils.dart';
import 'package:flutter_task_app/utils/local_storage_utils.dart';
import 'package:flutter_task_app/widget/message_snack_bar_widget.dart';
import 'package:get/get.dart';

class UserLoginController extends GetxController {

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  RxBool isSubmit = false.obs;


  Future<void> userLoginController({
    required BuildContext context,
    required String password,
    required String email,
  }) async {

    isSubmit.value = true;

    Map<String,dynamic> data = {
      "email": email,
      "password": password,
    };

    print(data);

    BaseApiUtils.post(
      url: ApiUtils.userLogin,
      data: data,
      onSuccess: (e,data) async {
        await LocalStorageUtils.setString(AppConstantUtils.userLoginResponse, jsonEncode(data));
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        Get.off(()=>HomeScreen(),preventDuplicates: false);
        isSubmit.value = false;
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
    );

  }



}