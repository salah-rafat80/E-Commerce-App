import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources_manager/network/api_helper.dart';
import '../../data/repo.dart';
import '../../data/model.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository orderRepository;

  OrderCubit() : orderRepository = OrderRepository(ApiHelper()), super(OrderInitial());

  Future<void> fetchOrders({String status = ""}) async {
    emit(OrderLoading());
    try {
      final orders = await orderRepository.getOrders();
      final filteredOrders = status.isNotEmpty
          ? orders.where((order) => order.status == status).toList()
          : orders;

      emit(OrderSuccess(filteredOrders));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> createOrder(List<OrderItem> items) async {
    try {
      emit(OrderLoading());
      await orderRepository.placeOrder(items);
      await fetchOrders(status: "active");
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> cancelOrder() async {
    try {
      emit(OrderLoading());
      await orderRepository.cancelOrder();
      await fetchOrders(status: "canceled");
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }

  Future<void> completeOrder() async {
    try {
      emit(OrderLoading());
      await orderRepository.completeOrder();
      await fetchOrders(status: "completed");
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
