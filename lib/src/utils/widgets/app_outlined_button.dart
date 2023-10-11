import 'package:translate_app/src_exports.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.widget,
    required this.onPressed,
    this.height = 60,
    this.width = double.maxFinite,
  });

  final Widget widget;
  final VoidCallback onPressed;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: AppColors.whiteClr, width: 2.0),
          ),
          child: widget),
    );
  }
}
