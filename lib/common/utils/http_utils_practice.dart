import 'package:dio/dio.dart';
import 'package:shop_app_flutter_udemy/global.dart';

class HttpUtilsPractice{
 late Dio dio;

 static final _instance = HttpUtilsPractice._internal();

 factory HttpUtilsPractice(){
  return _instance;
 }

 HttpUtilsPractice._internal(){
  BaseOptions options = BaseOptions(
   baseUrl: "http://127.0.0.1:8000",
   connectTimeout: const Duration(seconds: 5),
   receiveTimeout: const Duration(seconds: 5),
   headers: {},
   contentType: "application/json: charset=utf-8",
   responseType: ResponseType.json
  );
  dio = Dio(options);

 }

 Map<String,dynamic>?getAuthorizationHeader(){
  var headers = <String,dynamic>{};
  var accessToken = Global.storageService.getUserAccessToken();
  if(accessToken.isNotEmpty){
    headers['Authorization']= 'Bearer $accessToken';
  }
  return headers;
 }

 post(String path,{Object? data, Map<String,dynamic>? queryParameters, Options? options})async{

  Options requestOptions = options??Options();
  requestOptions.headers = requestOptions.headers??{};

  Map<String,dynamic>? authorizations = getAuthorizationHeader();
  if(authorizations!=null){
   requestOptions.headers!.addAll(authorizations);
  }

  var response = await dio.post(path,data: data,queryParameters: queryParameters,options: requestOptions);
  return response.data;
 }






}