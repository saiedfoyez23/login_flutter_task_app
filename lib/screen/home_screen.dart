import 'package:flutter/material.dart';
import 'package:flutter_task_app/service/home_controller.dart';
import 'package:flutter_task_app/utils/color_utils.dart';
import 'package:flutter_task_app/utils/responsive_utils.dart';
import 'package:flutter_task_app/widget/text_helper_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>CustomScrollView(
          slivers: [

            SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.all(10.r(context)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.center,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black96,
                      text: "Name : ${homeController.userLoginResponseModel.value.user?.name ?? ""}",
                    ),


                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.center,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      textColor: ColorUtils.black96,
                      text: "Email : ${homeController.userLoginResponseModel.value.user?.email ?? ""}",
                    ),

                  ],
                ),
              ),
            )

          ]
      )),
    );
  }
}
