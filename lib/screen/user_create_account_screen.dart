import 'package:flutter/material.dart';
import 'package:flutter_task_app/screen/user_auth_splash_screen.dart';
import 'package:flutter_task_app/service/user_create_account_controller.dart';
import 'package:flutter_task_app/utils/color_utils.dart';
import 'package:flutter_task_app/utils/responsive_utils.dart';
import 'package:flutter_task_app/widget/auth_app_bar_helper_widget.dart';
import 'package:flutter_task_app/widget/button_helper_widget.dart';
import 'package:flutter_task_app/widget/loading_helper_widget.dart';
import 'package:flutter_task_app/widget/space_helper_widget.dart';
import 'package:flutter_task_app/widget/text_form_field_widget.dart';
import 'package:flutter_task_app/widget/text_helper_widget.dart';
import 'package:get/get.dart';

import '../widget/message_snack_bar_widget.dart';

class UserCreateAccountScreen extends StatelessWidget {
  UserCreateAccountScreen({super.key});

  final UserCreateAccountController userCreateAccountController = Get.put(UserCreateAccountController());


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,onPopInvoked) {
        Get.off(()=>UserAuthSplashScreen(),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>SafeArea(
          child: Container(
            height: 930.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: ColorUtils.white251,
            ),
            child: CustomScrollView(
              slivers: [

                AuthAppBarHelperWidget(
                  onBackPressed: () async {
                    Get.off(()=>UserAuthSplashScreen(),preventDuplicates: false);
                  },
                ),


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                    child: Column(
                      children: [


                        SpaceHelperWidget.v(48.h(context)),



                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          textColor: ColorUtils.black48,
                          text: "Create account",
                        ),

                        SpaceHelperWidget.v(6.h(context)),

                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          textColor: ColorUtils.black96,
                          text: "Fill your information below or register with your account..",
                        ),

                        SpaceHelperWidget.v(32.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "User name",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter your user name",
                          controller: userCreateAccountController.userNameController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperWidget.v(20.h(context)),

                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Email",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                          context: context,
                          hintText: "Enter your email",
                          controller: userCreateAccountController.emailController.value,
                          keyboardType: TextInputType.emailAddress,
                        ),


                        SpaceHelperWidget.v(20.h(context)),


                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Password",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                            context: context,
                            hintText: "Enter password",
                            obscureText: userCreateAccountController.isObscure.value,
                            controller: userCreateAccountController.passwordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(userCreateAccountController.isObscure.value == true) {
                                  userCreateAccountController.isObscure.value = false;
                                } else {
                                  userCreateAccountController.isObscure.value = true;
                                }
                              },
                              child: Icon(
                                userCreateAccountController.isObscure.value == true ? Icons.visibility_off : Icons.visibility,
                                size: 24.r(context),
                                color: ColorUtils.black96,
                              ),
                            )
                        ),


                        SpaceHelperWidget.v(20.h(context)),



                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          textColor: ColorUtils.black96,
                          text: "Confirm Password",
                        ),

                        SpaceHelperWidget.v(6.h(context)),


                        TextFormFieldWidget.build(
                            context: context,
                            hintText: "Enter confirm password",
                            obscureText: userCreateAccountController.isConfirmObscure.value,
                            controller: userCreateAccountController.confirmPasswordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(userCreateAccountController.isConfirmObscure.value == true) {
                                  userCreateAccountController.isConfirmObscure.value = false;
                                } else {
                                  userCreateAccountController.isConfirmObscure.value = true;
                                }
                              },
                              child: Icon(
                                userCreateAccountController.isConfirmObscure.value == true ? Icons.visibility_off : Icons.visibility,
                                size: 24.r(context),
                                color: ColorUtils.black96,
                              ),
                            )
                        ),


                        SpaceHelperWidget.v(20.h(context)),

                        userCreateAccountController.isLoading.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(context: context) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(userCreateAccountController.userNameController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your user name");
                            } else if(userCreateAccountController.emailController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your email");
                            } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$',).hasMatch(userCreateAccountController.emailController.value.text)) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter a valid email");
                            } else if(userCreateAccountController.passwordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your password");
                            } else if(userCreateAccountController.passwordController.value.text.length < 8 ) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Please enter 8 character password");
                            } else if(userCreateAccountController.confirmPasswordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter your confirm password");
                            } else if(userCreateAccountController.confirmPasswordController.value.text != userCreateAccountController.passwordController.value.text) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Password is not match");
                            } else {
                              userCreateAccountController.isLoading.value = true;
                              await userCreateAccountController.createUserAccountController(
                                context: context,
                                userName: userCreateAccountController.userNameController.value.text,
                                email: userCreateAccountController.emailController.value.text,
                                password: userCreateAccountController.passwordController.value.text,
                              );
                            }
                          },
                          text: "Sign Up",
                        ),


                        SpaceHelperWidget.v(32.h(context)),



                      ],
                    ),
                  ),
                )



              ],
            ),
          ),
        )),
      ),
    );
  }
}
