import 'package:translate_app/src_exports.dart';

class Pages {
  static List<GetPage> pages = [
    GetPage(name: Routes.ROOT, page: () => Root()),
    GetPage(name: Routes.SPLASH, page: () => SplashScreen()),
    GetPage(name: Routes.HOME, page: () => HomeScreen()),
  ];
}
