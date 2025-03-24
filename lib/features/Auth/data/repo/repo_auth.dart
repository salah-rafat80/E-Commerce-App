import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/features/Auth/data/model/model_use.dart';

import '../../../../core/local/local.dart';
import '../../../../core/resources_manager/network/api_helper.dart';
import '../../../../core/resources_manager/network/api_response.dart';
import '../../../../core/resources_manager/network/endpoints.dart';

class AuthRepo {
  AuthRepo._internal();
  static AuthRepo _instance = AuthRepo._internal();
  factory AuthRepo() {
    return _instance;
  }
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
          endPoint: Endpoints.register,
          data: {
            'email': email,
            'password': password,
            'name': name,
            'phone': phone
          });
      if (apiResponse.status) {
        return Right(apiResponse.message);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }

  User? user;

  Future<Either<String, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      ApiResponse response = await apiHelper.postRequest(
        endPoint: Endpoints.login,
        data: {"email": email, "password": password},
        isAuthorized: false,
      );
      if (response.status) {
        UserModel loginResponseModel = UserModel.fromJson(response.data!);
        LocalData.accessToken = loginResponseModel.accessToken!;
        LocalData.refreshToken = loginResponseModel.refreshToken!;
        if (loginResponseModel.user == null) {
          return Left(response.message);
        }

        return Right(loginResponseModel.user!);
      } else {
        // error
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
