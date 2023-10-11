import 'package:translate_app/src_exports.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController ctrl = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appBgColor,
        centerTitle: true,
        title: const Text("Translate App"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppTextField(
                hintText: "Type here...",
                suffixIcon: IconButton(
                  onPressed: () => ctrl.detectText.value.clear(),
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.whiteClr,
                  ),
                ),
                controller: ctrl.detectText.value,
                onChanged: (value) async => await ctrl.detectApi(text: value),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Obx(
                      () => Text(
                        ctrl.detectLanguage.value,
                        style: const TextStyle(color: AppColors.whiteClr),
                      ),
                    )
                  ],
                ),
              ),
              AppElevatedButton(
                text: 'Select Language',
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Get.bottomSheet(
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.appBgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Obx(
                        () {
                          return ctrl.isLoading.isTrue
                              ? const LoaderView()
                              : Column(
                                  children: [
                                    AppTextField(
                                      controller: ctrl.filterText.value,
                                      suffixIcon: IconButton(
                                        onPressed: () =>
                                            ctrl.filterText.value.clear(),
                                        icon: const Icon(
                                          Icons.close,
                                          color: AppColors.whiteClr,
                                        ),
                                      ),
                                      hintText: "Search...",
                                      onChanged: (value) =>
                                          ctrl.filterLanguageList(),
                                    ),
                                    const Divider(color: AppColors.whiteClr)
                                        .marginSymmetric(vertical: 10.0),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: ctrl.filterList.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              ctrl.selectedLanguage.value = ctrl
                                                  .filterList[index]
                                                  .languageName;
                                              ctrl.selectedLanguageCode.value =
                                                  ctrl.filterList[index]
                                                      .languageCode;
                                              Get.back();
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.all(7.0),
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                  color: AppColors.color393E48,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    ctrl.filterList[index]
                                                        .languageName,
                                                    style: const TextStyle(
                                                        color:
                                                            AppColors.whiteClr),
                                                  ),
                                                  const SizedBox(width: 10.0),
                                                  Flexible(
                                                    child: Text(
                                                      '(${ctrl.filterList[index].languageCode})',
                                                      style: const TextStyle(
                                                          color: AppColors
                                                              .whiteClr),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ).marginSymmetric(horizontal: 20.0);
                        },
                      ),
                    ),
                  );
                  await ctrl.getLanguageApi();
                },
              ),
              const SizedBox(height: 20),
              AppElevatedButton(
                text: 'Translate',
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (ctrl.selectedLanguage.isNotEmpty) {
                    await ctrl.translateApi(
                      text: ctrl.detectText.value.text,
                      target: ctrl.selectedLanguageCode.value,
                      source: ctrl.detectLanguageCode.value,
                    );
                  } else {
                    AppToast.snackBarToast(
                        message: "Please select language type");
                  }
                },
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Obx(
                      () => Text(
                        ctrl.selectedLanguage.value,
                        style: const TextStyle(color: AppColors.whiteClr),
                      ),
                    )
                  ],
                ),
              ),
              Obx(() => ctrl.isLoading2.value
                  ? const LoaderView()
                  : AppTextField(
                      readOnly: true,
                      hintText: "Showing translated text",
                      controller: ctrl.translateText.value,
                    )),
            ],
          ).marginSymmetric(horizontal: 20),
        ),
      ),
    );
  }
}
