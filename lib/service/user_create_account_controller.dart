import 'package:flutter/cupertino.dart';
import 'package:flutter_task_app/screen/user_login_screen.dart';
import 'package:flutter_task_app/utils/api_utils.dart';
import 'package:flutter_task_app/utils/base_api_utils.dart';
import 'package:flutter_task_app/widget/message_snack_bar_widget.dart';
import 'package:get/get.dart';

class UserCreateAccountController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool isConfirmObscure = true.obs;


  Future<void> createUserAccountController({
    required BuildContext context,
    required String password,
    required String email,
    required String userName,
  }) async {

    Map<String,dynamic> data = {
      "name": userName,
      "email": email,
      "password": password
    };

    print(data);

    BaseApiUtils.post(
      url: ApiUtils.userRegistration,
      data: data,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        Get.off(()=>UserLoginScreen(),preventDuplicates: false);
        isLoading.value = false;
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );

  }

}