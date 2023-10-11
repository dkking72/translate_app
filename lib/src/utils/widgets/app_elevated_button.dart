import 'package:translate_app/src_exports.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 60,
    this.width = double.maxFinite,
  });

  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.orangeYellow,
        ),
        child: Text(
          text,
          style: const TextStyle(color: AppColors.blackClr),
        ),
      ),
    );
  }
}
