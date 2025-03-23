
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/local/local.dart';

import 'api_response.dart';
import 'endpoints.dart';

class ApiHelper {
  static final ApiHelper _singleton = ApiHelper._internal();

  factory ApiHelper() => _singleton;

  ApiHelper._internal();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<ApiResponse> getRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try{
      var response = await dio.get(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized) "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc0Mjc1NTU4NCwianRpIjoiMjZjMjUxMjMtMTlmMS00MTI3LTgxMmUtMTM2OTU2OGMwOWIzIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MiwibmJmIjoxNzQyNzU1NTg0LCJjc3JmIjoiYmJkM2JlZGItZTIyNy00OTA5LWJkNTQtZTMwNTI5ZDZkNjhjIiwiZXhwIjoxNzQyNzU2NDg0fQ.4EvOG9RK3FTk-sYbZlzfIpyIFC4WH07MYvoT6bvtfSk",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e as DioException);
    }
  }


  Future<ApiResponse> postRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try{
      var response = await dio.post(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e as DioException);
    }
  }

  Future<ApiResponse> putRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try{
      var response = await dio.put(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized) "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc0Mjc2MDg2NiwianRpIjoiNjNhNzdiMWMtODMyMC00MTk5LThmODgtOGNjODkwZjViZTQzIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MiwibmJmIjoxNzQyNzYwODY2LCJjc3JmIjoiMDg4NGJlN2UtOTkwYS00YjcxLThjZTItM2UzZWNmNmFhZWRlIiwiZXhwIjoxNzQyNzYxNzY2fQ.kl1KNgN5JpwVilADoYu2sQQn5gJMepnpFcWsORNfPSA",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e as DioException);
    }
  }
  Future<ApiResponse> deleteRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try{
      var response = await dio.delete(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e as DioException);
    }
  }

}


