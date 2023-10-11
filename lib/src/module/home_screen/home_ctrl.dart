import 'package:translate_app/src_exports.dart';

class HomeScreenController extends GetxController {
  Rx<TextEditingController> detectText = TextEditingController().obs;
  Rx<TextEditingController> translateText = TextEditingController().obs;
  RxList<LanguageModel> languageList = <LanguageModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoading2 = false.obs;
  RxString selectedLanguage = ''.obs;
  RxString detectLanguage = ''.obs;
  RxString selectedLanguageCode = ''.obs;
  RxString detectLanguageCode = ''.obs;
  Rx<TextEditingController> filterText = TextEditingController().obs;
  RxList<LanguageModel> filterList = <LanguageModel>[].obs;

  languagePicker1() {
    /*showDialog(
      context: Get.context!,
      builder: (context) => Theme(
        data: ThemeData.dark(),
        child: LanguagePickerDialog(
          titlePadding: EdgeInsets.all(8.0),
          searchInputDecoration: InputDecoration(
            hintText: 'Search...',
          ),
          isSearchable: true,
          title: Text('Select your language'),
          onValuePicked: (Language language) {
            selectedDialogLanguage.value = language;
            loggerNoStack.i(selectedDialogLanguage.value.name);
            loggerNoStack.i(selectedDialogLanguage.value.isoCode);
          },
          itemBuilder: (language) {
            return Row(
              children: <Widget>[
                Text(language.name),
                SizedBox(width: 8.0),
                Flexible(child: Text("(${language.isoCode})"))
              ],
            );
          },
        ),
      ),
    );*/
  }

  Future<void> getLanguageApi() async {
    try {
      isLoading(true);
      ResponseModel response =
          await net.get(UrlConst.languageUrl, {"target": "en"});
      languageList.value = List<LanguageModel>.from(
          response.data['languages'].map((e) => LanguageModel.fromJson(e)));
      filterList.value = languageList;
      isLoading(false);
    } catch (e, t) {
      isLoading(false);
      AppToast.snackBarToast(message: e.toString());
      logger.e("GET LANGUAGE API => ", error: e, stackTrace: t);
    }
  }

  Future<void> translateApi({
    required String text,
    required String target,
    required String source,
  }) async {
    try {
      isLoading2(true);
      /*var httpClient = HttpClient();
      var uri = Uri.https('google-translate1.p.rapidapi.com', '/language/translate/v2/detect');
      var request = await httpClient.postUrl(uri);
      request.headers.contentType = ContentType('application', 'x-www-form-urlencoded');
      request.headers.set('Accept-Encoding', 'application/gzip');
      request.headers.set('X-RapidAPI-Key', '1d58ffe55amshd5ceac888c78588p12572bjsnfca3e1517e19');
      request.headers.set('X-RapidAPI-Host', 'google-translate1.p.rapidapi.com');
      request.write('q=%E0%AA%95%E0%AB%87%E0%AA%B5%E0%AB%80%20%E0%AA%B0%E0%AB%80%E0%AA%A4%E0%AB%87');
      var response = await request.close();
      var data = await response.transform(utf8.decoder).join();
      logger.w(data);*/
      /*==================================================*/
      var httpClient = HttpClient();
      var uri = Uri.https(KeyConst.hostName, '/language/translate/v2');
      var request = await httpClient.postUrl(uri);
      request.headers.contentType =
          ContentType('application', 'x-www-form-urlencoded');
      // request.headers.set('Accept-Encoding', 'application/gzip');
      request.headers.set('X-RapidAPI-Key', KeyConst.apiKey);
      request.headers
          .set('X-RapidAPI-Host', 'google-translate1.p.rapidapi.com');
      request.write('q=$text&target=$target');
      var response = await request.close();
      var data = await response.transform(utf8.decoder).join();
      logger.w(jsonDecode(data)['data']['translations'][0]['translatedText']);
      translateText.value.text =
          jsonDecode(data)['data']['translations'][0]['translatedText'];
      isLoading2(false);
      /*=======================================================*/
      /*Dio dio = Dio();
      Response response2 = await dio.post(
        UrlConst.translateUrl,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'X-RapidAPI-Key':
                "1d58ffe55amshd5ceac888c78588p12572bjsnfca3e1517e19",
            'X-RapidAPI-Host': "google-translate1.p.rapidapi.com",
          },
        ),
        queryParameters: {'source': 'en','q': 'how', 'target': 'gu'},
      );
      AppToast.snackBarToast(message: response2.data);*/
      /*====================================================*/
      // ResponseModel response = await net.post(
      //     UrlConst.translateUrl, {'target': 'gu', 'q': 'how', 'source': 'en'});
      // AppToast.snackBarToast(message: response.message);
      // isLoading(false);
    } catch (e, t) {
      isLoading2(false);
      AppToast.snackBarToast(message: e.toString());
      logger.e("POST TRANSLATE API => ", error: e, stackTrace: t);
    }
  }

  Future<void> detectApi({required String text}) async {
    try {
      var httpClient = HttpClient();
      var uri = Uri.https(KeyConst.hostName, '/language/translate/v2/detect');
      var request = await httpClient.postUrl(uri);
      request.headers.contentType =
          ContentType('application', 'x-www-form-urlencoded');
      request.headers.set('Accept-Encoding', 'application/gzip');
      request.headers.set('X-RapidAPI-Key', KeyConst.apiKey);
      request.headers
          .set('X-RapidAPI-Host', 'google-translate1.p.rapidapi.com');
      request.write('q=$text');
      var response = await request.close();
      var data = await response.transform(utf8.decoder).join();
      logger.w(jsonDecode(data)['data']['detections'][0][0]['language']);
      detectLanguage.value =
          jsonDecode(data)['data']['detections'][0][0]['language'];
    } catch (e, t) {
      AppToast.snackBarToast(message: e.toString());
      logger.e("POST DETECT API => ", error: e, stackTrace: t);
    }
  }

  filterLanguageList() {
    filterList.value = languageList
        .where((p0) => p0.languageName.toLowerCase().contains(filterText.value.text.toLowerCase()))
        .toList();
  }
}
