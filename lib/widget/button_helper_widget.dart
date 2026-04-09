import 'package:flutter/material.dart';
import 'package:flutter_task_app/utils/color_utils.dart';
import 'package:flutter_task_app/utils/responsive_utils.dart';
import 'package:flutter_task_app/widget/text_helper_widget.dart';
import 'package:google_fonts/google_fonts.dart';


class ButtonHelperWidget {


  static Widget customButtonWidgetAdventPro({
    required BuildContext context,
    required VoidCallback onPressed,
    required String text,
    double? height,
    Color? backgroundColor,
    Color? textColor,
    Alignment? alignment,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? fontSize,
    FontWeight? fontWeight,
    bool isFullWidth = false,
    Widget? icon,
  }) {
    return Container(
      height: height?.h(context) ?? 56.h(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorUtils.orange119,
        borderRadius: BorderRadius.circular((borderRadius ?? 10).r(context)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(
            vertical: 14.5.vpm(context),
            horizontal: 14.5.hpm(context),
          ),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: TextHelperClass.headingTextWithoutWidthAdventPro(
          context: context,
          alignment: alignment ?? Alignment.center,
          fontSize: fontSize ?? 18,
          fontWeight: fontWeight ?? FontWeight.w700,
          textColor: textColor ?? ColorUtils.white251,
          text: text,
        ),
      ),
    );
  }



  static Widget customButtonWidget({
    required BuildContext context,
    required VoidCallback onPressed,
    required String text,
    double? height,
    Color? backgroundColor,
    Color? textColor,
    Alignment? alignment,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? fontSize,
    FontWeight? fontWeight,
    bool isFullWidth = false,
    Widget? icon,
  }) {
    return Container(
      height: height?.h(context) ?? 56.h(context),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorUtils.orange119,
        borderRadius: BorderRadius.circular((borderRadius ?? 10).r(context)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.symmetric(
            vertical: 14.5.vpm(context),
            horizontal: 14.5.hpm(context),
          ),
          shadowColor: Colors.transparent,
          overlayColor: Colors.transparent,
        ),
        child: TextHelperClass.headingTextWithoutWidth(
          context: context,
          alignment: alignment ?? Alignment.center,
          fontSize: fontSize ?? 18,
          fontWeight: fontWeight ?? FontWeight.w700,
          textColor: textColor ?? ColorUtils.white251,
          text: text,
        ),
      ),
    );
  }

  static Widget customRichTextButton({
    required BuildContext context,
    required String normalText,
    required String highlightedText,
    required VoidCallback? onPressed,
    Alignment alignment = Alignment.center,
    Color normalTextColor = ColorUtils.blue96,
    Color highlightedTextColor = ColorUtils.blue196,
    double fontSize = 17,
    FontWeight normalTextWeight = FontWeight.w400,
    FontWeight highlightedTextWeight = FontWeight.w700,
    double lineHeight = 1.5,
    EdgeInsetsGeometry? padding,
  }) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: padding,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: fontSize.sp(context),
              fontWeight: normalTextWeight,
              color: normalTextColor,
              height: lineHeight,
            ),
            children: [
              TextSpan(text: normalText),
              TextSpan(
                text: highlightedText,
                style: GoogleFonts.poppins(
                  fontSize: fontSize.sp(context),
                  fontWeight: highlightedTextWeight,
                  color: highlightedTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }








}