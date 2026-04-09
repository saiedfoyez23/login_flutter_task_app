import 'package:flutter/material.dart';
import 'package:flutter_task_app/screen/user_auth_splash_screen.dart';
import 'package:flutter_task_app/service/user_login_controller.dart';
import 'package:flutter_task_app/utils/color_utils.dart';
import 'package:flutter_task_app/utils/responsive_utils.dart';
import 'package:flutter_task_app/widget/button_helper_widget.dart';
import 'package:flutter_task_app/widget/loading_helper_widget.dart';
import 'package:flutter_task_app/widget/message_snack_bar_widget.dart';
import 'package:flutter_task_app/widget/space_helper_widget.dart';
import 'package:flutter_task_app/widget/text_form_field_widget.dart';
import 'package:get/get.dart';

import '../widget/auth_app_bar_helper_widget.dart';
import '../widget/text_helper_widget.dart';

class UserLoginScreen extends StatelessWidget {
  UserLoginScreen({super.key});

  final UserLoginController userLoginController = Get.put(UserLoginController());

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
                          text: "Login",
                        ),

                        SpaceHelperWidget.v(6.h(context)),

                        TextHelperClass.headingTextWithoutWidth(
                          context: context,
                          alignment: Alignment.centerLeft,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          textColor: ColorUtils.black96,
                          text: "Hi Welcome back..! Please enter your correct Information And continue ",
                        ),

                        SpaceHelperWidget.v(32.h(context)),

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
                          controller: userLoginController.emailController.value,
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
                            hintText: "Enter your password",
                            obscureText: userLoginController.isObscure.value,
                            controller: userLoginController.passwordController.value,
                            keyboardType: TextInputType.emailAddress,
                            suffixIcon: InkWell(
                              onTap: () async {
                                if(userLoginController.isObscure.value == true) {
                                  userLoginController.isObscure.value = false;
                                } else {
                                  userLoginController.isObscure.value = true;
                                }
                              },
                              child: Icon(
                                userLoginController.isObscure.value == true ? Icons.visibility_off : Icons.visibility,
                                size: 24.r(context),
                                color: ColorUtils.black96,
                              ),
                            )
                        ),


                        SpaceHelperWidget.v(20.h(context)),

                        userLoginController.isSubmit.value == true ?
                        LoadingHelperWidget.loadingHelperWidget(context: context) :
                        ButtonHelperWidget.customButtonWidgetAdventPro(
                          context: context,
                          onPressed: () async {
                            if(userLoginController.emailController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your email");
                            } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$',).hasMatch((userLoginController.emailController.value.text))) {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Enter a valid email");
                            } else if(userLoginController.passwordController.value.text == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Enter your password");
                            } else {
                              await userLoginController.userLoginController(
                                context: context,
                                password: userLoginController.passwordController.value.text,
                                email: userLoginController.emailController.value.text,
                              );
                            }
                          },
                          text: "Sign In",
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
