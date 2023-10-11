import 'package:translate_app/src_exports.dart';

class LoaderView extends StatelessWidget {
  const LoaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpinKitDoubleBounce(
            color: AppColors.orangeShadeColor,
          ),
          const SizedBox(height: 15),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Loading...',
                textStyle: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.pewterBlue
                ),
                speed: const Duration(milliseconds: 100)
              ),
            ],
            repeatForever: true,
          )
        ],
      ),
    );
  }
}
