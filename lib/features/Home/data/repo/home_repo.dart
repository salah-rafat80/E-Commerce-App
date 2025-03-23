import 'package:dartz/dartz.dart';

import '../../../../core/resources_manager/network/api_helper.dart';
import '../../../../core/resources_manager/network/api_response.dart';
import '../../../../core/resources_manager/network/endpoints.dart';
import '../model/best_selleing_model.dart';

class HomeRepo {
  HomeRepo._internal();

  static HomeRepo instance = HomeRepo._internal();

  static getinstance() {
    return instance;
  }

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, List<BestSellingModel>>> bestSeller() async {
    ApiResponse response = await apiHelper.getRequest(
      url: Endpoints.bestSeller,
      isAuthorized: true,
    );

    // تحقق من أن البيانات ليست null ومن نوع Map
    if (response.data == null || response.data is! Map<String, dynamic>) {
      return left("Invalid response format");
    }

    try {
      BestSellingModel bestSelling = BestSellingModel.fromJson(response.data!);
      if (bestSelling.bestSellerProducts == null) {
        return left("No products available");
      }
      return right([bestSelling]);
    } catch (e) {
      return left("Data parsing failed: ${e.toString()}");
    }
  }

  // Future<Either<String, String>> getUserData() async {
  //   ApiResponse response = await apiHelper.getRequest(
  //     url: Endpoints.getUserData,
  //     isAuthorized: true,
  //   );
  //
  //   if (response.status) {
  //     BestSelleingModel responseModel = BestSelleingModel.fromJson(response.data!);
  //     return right(responseModel.bestSellerProducts != null
  //         ? responseModel.bestSellerProducts!.map((e) => e.toJson()).toList().toString()
  //         : "No products available");
  //   } else {
  //     return left(response.message);
  //   }
  // }
}