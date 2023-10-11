import 'package:translate_app/src_exports.dart';

class AppToast {
  static void snackBarToast({
    required String message,
    bool isSuccess = true,
  }) {
    Get.snackbar(
      "","",
      borderRadius: 15.0,
      maxWidth: Get.width - 200,
      // backgroundColor: AppColor.primary,
      // colorText: AppColor.white,
      titleText: const SizedBox(),
      messageText: Text(message, style: const TextStyle(color: AppColors.whiteClr)).marginOnly(bottom: 5.0),
      duration: const Duration(milliseconds: 3000),
      backgroundColor: AppColors.blackClr.withOpacity(0.5),
      dismissDirection: DismissDirection.down,
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
      forwardAnimationCurve: Curves.linear,
      reverseAnimationCurve: Curves.linear,
      margin: const EdgeInsets.only(bottom: 50.0),
      padding: const EdgeInsets.all(10.0),
    );
  }
}