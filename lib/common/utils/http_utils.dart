import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';
import 'package:shop_app_flutter_udemy/global.dart';

class HttpUtil {
//singleton class
  //HttpUtil._internal(); we need to some initialization with the private construction called
  //how to prove that this class has one instance? Ans. We can prove it with the help of hashCode
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    print('HttpUtils called');
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppConstants.SERVER_API_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json);

    dio = Dio(options);

    //to get the error exactly which points the error,to know is it occurred in the request, response or error section
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (kDebugMode) {
        print('app request data ${options.data}');
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      if (kDebugMode) {
        print('app response data ${response.data}');
      }
      return handler.next(response);
    }, onError: (DioException e, handler) {
      if (kDebugMode) {
        print("app error data: $e");
      }
      ErrorEntity errorEntity = createErrorEntity(
          e); //now we will know what type of error has occurred
      onError(errorEntity);
    }));
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserAccessToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    print('hit post method');
    Options requestOptions = options ??
        Options(); //this 'Options() will get all the data from the above BaseOptions'
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(
          authorization); //'addAll()' will replace all the old data with the new one, it is used for that reason
    }
    print('done with header');

    var response = await dio.post(path,
        queryParameters: queryParameters, options: requestOptions, data: data);
    print('done with post: ${response.data}');
    //we can do also like this
     print('done with post ${response.data["message"]}');
    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception code: $code,$message";
  }
}


ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection timed out");
      //no break keyword is required since we have return
    case DioExceptionType.sendTimeout:
      //TODO: handle send time out
      return ErrorEntity(code: -1, message: "Send timed out");
    case DioExceptionType.badCertificate:
      //TODO: handle bad certificate
      return ErrorEntity(code: -1, message: "Bad SSL certificate");
    case DioExceptionType.badResponse:
      //TODO: handle bad response
      print('bad response...');
      switch(error.response!.statusCode){
        case 400:
          return ErrorEntity(code: 400, message: "Server syntax error");
        case 401:
          return ErrorEntity(code: 401, message: "Permission denied");

      }
      return ErrorEntity(code: -1, message: "Bad response error");
    case DioExceptionType.connectionError:
      //TODO: hand connection error
      return ErrorEntity(code: -1, message: "Connection error");
    case DioExceptionType.unknown:
      //TODO: handle unknown
      return ErrorEntity(code: -1, message: "Unknown error");
    case DioExceptionType.cancel:
      //TODO: handle cancel
      return ErrorEntity(code: -1, message: "Server canceled it");
    case DioExceptionType.receiveTimeout:
      //TODO: handle receive time out
      return ErrorEntity(code: -1, message: "Receive timed out");
  }
}

void onError(ErrorEntity errorEntity) {
  print(
      "error.code->${errorEntity.code}, error.message->${errorEntity.message}");
  switch (errorEntity.code) {
    case 400:
      print('Server syntax error');
      break;
    case 401:
      print('You are denied to continue');
      break;
    case 500:
      print('Internal server error');
      break;
    default:
      print("Unknown error");
      break;
  }
}
