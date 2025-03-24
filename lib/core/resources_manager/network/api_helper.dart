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
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // ignore: avoid_print
          print("Headers : ${options.headers.toString()}");
          // ignore: avoid_print
          print("data : ${(options.data as FormData).fields.toString()}");
          // ignore: avoid_print
          print("method : ${options.method}");
          // ignore: avoid_print
          print("EndPoint : ${options.path}");
          return handler.next(options); // Continue request
        },
      ),
    );

  Future<ApiResponse> getRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.get(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized)
              "Authorization":
                  "Bearer ${LocalData.accessToken}",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e as DioException);
    }
  }

  Future<ApiResponse> postRequest(
      {required String endPoint,
        Map<String, dynamic>? data,
        bool isFormData = true,
        bool isAuthorized = true}) async {
    try {
      var response = await dio.post(endPoint,
          data: isFormData ? FormData.fromMap(data ?? {}) : data,
          options: Options(headers: {
            if (isAuthorized) "Authorization": "Bearer ${LocalData.accessToken}"
          }));
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }
  Future<ApiResponse> putRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.put(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized)
              "Authorization":
                  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc0Mjc2MDg2NiwianRpIjoiNjNhNzdiMWMtODMyMC00MTk5LThmODgtOGNjODkwZjViZTQzIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MiwibmJmIjoxNzQyNzYwODY2LCJjc3JmIjoiMDg4NGJlN2UtOTkwYS00YjcxLThjZTItM2UzZWNmNmFhZWRlIiwiZXhwIjoxNzQyNzYxNzY2fQ.kl1KNgN5JpwVilADoYu2sQQn5gJMepnpFcWsORNfPSA",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e as DioException);
    }
  }

  Future<ApiResponse> deleteRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.delete(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized)
              "Authorization": "Bearer ${LocalData.accessToken}",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e as DioException);
    }
  }
}
