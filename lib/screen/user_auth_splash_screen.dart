import 'package:flutter/material.dart';
import 'package:flutter_task_app/screen/user_create_account_screen.dart';
import 'package:flutter_task_app/screen/user_login_screen.dart';
import 'package:flutter_task_app/service/user_auth_splash_controller.dart';
import 'package:flutter_task_app/utils/color_utils.dart';
import 'package:flutter_task_app/utils/responsive_utils.dart';
import 'package:flutter_task_app/widget/button_helper_widget.dart';
import 'package:flutter_task_app/widget/space_helper_widget.dart';
import 'package:get/get.dart';

class UserAuthSplashScreen extends StatelessWidget {
  UserAuthSplashScreen({super.key});

  final UserAuthSplashController userAuthSplashController = Get.put(UserAuthSplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 930.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: ColorUtils.white251,
        ),
        child: CustomScrollView(
          slivers: [

            SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.hpm(context)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [



                    ButtonHelperWidget.customButtonWidgetAdventPro(
                      context: context,
                      onPressed: () async {
                        Get.off(()=>UserCreateAccountScreen(),preventDuplicates: false);
                      },
                      text: "Sign Up",
                    ),


                    SpaceHelperWidget.v(16.h(context)),


                    ButtonHelperWidget.customButtonWidgetAdventPro(
                      context: context,
                      onPressed: () async {
                        Get.off(()=>UserLoginScreen(),preventDuplicates: false);
                      },
                      text: "Sign In",
                    ),


                    SpaceHelperWidget.v(32.h(context)),



                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
