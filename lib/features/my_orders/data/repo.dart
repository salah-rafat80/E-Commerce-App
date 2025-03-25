
import 'package:ecommerce_app/core/resources_manager/network/endpoints.dart';

import '../../../core/resources_manager/network/api_helper.dart';
import 'model.dart';

class OrderRepository {
  final ApiHelper _apiHelper;

  OrderRepository(this._apiHelper);

  Future<List<OrderModel>> getOrders() async {
    final response = await _apiHelper.getRequest(
      url: Endpoints.getOrders,
    );
    if (response == null) throw Exception("Failed to fetch orders.");
    if (response.data['status'] == true) {
      return (response.data['data'] as List).map((e) => OrderModel.fromJson(e)).toList();
    } else {
      throw Exception(response.data['message']);
    }
  }

  Future<void> placeOrder(List<OrderItem> items) async {
    final response = await _apiHelper.postRequest(
      endPoint: Endpoints.placeOrder,
      data: {"items": items.map((e) => e.toJson()).toList()},
    );

    if (response == null) throw Exception("Failed to place order.");

    if (response.data['status'] != true) {
      throw Exception(response.data['message']);
    }
  }

  Future<void> cancelOrder() async {
    final response = await _apiHelper.postRequest(
      endPoint: Endpoints.cancelOrder,
    );

    if (response == null) throw Exception("Failed to cancel order.");

    if (response.data['status'] != true) {
      throw Exception(response.data['message']);
    }
  }

  Future<void> completeOrder() async {
    final response = await _apiHelper.postRequest(
      endPoint:Endpoints.completeOrder,
    );

    if (response == null) throw Exception("Failed to complete order.");

    if (response.data['status'] != true) {
      throw Exception(response.data['message']);
    }
  }
}
