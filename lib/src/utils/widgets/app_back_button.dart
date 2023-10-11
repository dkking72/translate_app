import 'package:translate_app/src_exports.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Image.asset(
        AssetConst.backButton,
        scale: 4.0,
      ),
    );
  }
}
