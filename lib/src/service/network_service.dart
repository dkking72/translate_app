import 'package:translate_app/src_exports.dart';

final Network net = Network();

class Network {
  static final Map<String, dynamic> _parameters = {};
  static final Network _instance = Network.internal();
  static final Dio _dio = Dio();

  Network.internal();

  factory Network() => _instance;

  Future<ResponseModel> get(String url, Map<String, dynamic> params) async {
    _dio.options.headers.addAll({
      "X-RapidAPI-Key": KeyConst.apiKey,
      "X-RapidAPI-Host": KeyConst.hostName,
    });
    _parameters.addAll({
      "X-RapidAPI-Key": KeyConst.apiKey,
      "X-RapidAPI-Host": KeyConst.hostName,
    });
    logger.d("URL: $url\nPARAMS: $params\nHEADERS: ${_dio.options.headers}");
    logger.d("GET");
    return _dio
        .get(url, queryParameters: params)
        .then(_success)
        .catchError(_failed);
  }

  Future<ResponseModel> post(
    String url,
    dynamic body, {
    bool isRaw = false,
    dynamic params,
  }) async {
    _dio.options.headers.addAll({
      "X-RapidAPI-Key": KeyConst.apiKey,
      "X-RapidAPI-Host": KeyConst.hostName,
    });
    _parameters.addAll({
      "X-RapidAPI-Key": KeyConst.apiKey,
      "X-RapidAPI-Host": KeyConst.hostName,
    });
    logger.d(
        "URL: $url\nBODY : $body\nPARAMS: $params\nHEADERS: ${_dio.options.headers}");
    dynamic data;
    if (isRaw) {
      data = json.encode(body);
    } else {
      data = FormData.fromMap(body);
    }
    logger.d("CALLING POST NET");
    return _dio
        .post(url, data: data, queryParameters: params,options: Options(contentType: Headers.jsonContentType,))
        .then(_success)
        .catchError(_failed);
  }

  ResponseModel _success(Response response) {
    final dynamic url = response.requestOptions.uri;
    final dynamic data = response.data;
    int? code = response.statusCode;
    logger.i("URL : $url\nRESPONSE ${response.statusCode} : $data");
    ResponseModel model = ResponseModel();
    if (code != null && code == 401) {
      // app.logout();
      model = ResponseModel();
    } else {
      model = ResponseModel.fromJson(data);
    }
    return model;
  }

  Future<ResponseModel> _failed(error) async {
    logger.e("onFailed", error: error, stackTrace: StackTrace.current);
    String message = "";
    try {
      if (!(await isConnected())) {
      } else if (error is DioException) {
        logger.e(error.response);
        DioException dError = error;
        switch (dError.type) {
          case DioExceptionType.cancel:
            message = "Request Cancelled";
            break;
          case DioExceptionType.connectionTimeout:
            message = "Connection Timeout";
            break;
          case DioExceptionType.unknown:
            message = "Something went wrong";
            break;
          case DioExceptionType.receiveTimeout:
            message = "Receive Timeout";
            break;
          case DioExceptionType.badResponse:
            int code = dError.response?.statusCode ?? 0;
            if (code == 404) {
              message = "Resource not found";
            } else if (code == 401) {
              message = "Unauthorized Access...!";
            } else {
              message = error.toString();
            }
            break;
          case DioExceptionType.sendTimeout:
            message = "Send Timeout";
            break;
          case DioExceptionType.badCertificate:
            // TODO: Handle this case.
            break;
          case DioExceptionType.connectionError:
            // TODO: Handle this case.
            break;
        }
      }
    } catch (e) {
      message = e.toString();
    }
    return ResponseModel(message: message, status: false);
  }

  Future<bool> isConnected() async {
    try {
      List<InternetAddress> list = await InternetAddress.lookup('google.com');
      return list.isNotEmpty && list[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
