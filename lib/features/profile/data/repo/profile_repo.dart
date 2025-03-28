import 'package:dartz/dartz.dart';

import '../../../../core/resources_manager/network/api_helper.dart';
import '../../../../core/resources_manager/network/api_response.dart';
import '../../../../core/resources_manager/network/endpoints.dart';
import '../../../Auth/data/model/model_use.dart';

class ProfileRepo{
  ProfileRepo._internal();

  static ProfileRepo instance = ProfileRepo._internal();

  static getinstance() {
    return instance;
  }

  ApiHelper apiHelper = ApiHelper();
  Future<Either<String, List<UserModel>>> UserData() async {
    ApiResponse response = await apiHelper.getRequest(
      url: Endpoints.getUserData,
      data: {
        "user":UserModel().user
      },
      isAuthorized: true,
    );
    print("response ${response.data.toString()}");
    print("response ${response.message.toString()}");
    // تحقق من أن البيانات ليست null ومن نوع Map
    if (response.data == null || response.data is! Map<String, dynamic>) {
      return left("Invalid response format");
    }

    try {
      UserModel userdata = UserModel.fromJson(response.data!);
      if (userdata.user == null) {
        return left("No user available");
      }
      return right([userdata]);
    } catch (e) {
      return left("Data parsing failed: ${e.toString()}");
    }
  }

}