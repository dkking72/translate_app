import 'src_exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'K9 Products',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      fallbackLocale: LocalizationService.fallbackLocale,
      locale: LocalizationService.locale,
      translations: LocalizationService(),
      initialRoute: Routes.ROOT,
      getPages: Pages.pages,
    );
  }
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(
        const Duration(seconds: 2),
        () {
          Get.offAllNamed(Routes.HOME);
          // Get.offAllNamed(Routes.HOME);
          // logger.w("USER => ${prefs.getUser.id}");
          // if(prefs.getUser.id != 0){
          //   Get.offNamedUntil(Routes.HOME,(route) => false);
          // }else{
          //   Get.off(Routes.LOGIN);
          // }
        },
      );
    });
    return const Scaffold(
      body: Center(
        child: SplashScreen(),
      ),
    );
  }
}
