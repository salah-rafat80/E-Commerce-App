 import '../../data/model.dart';

class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final List<OrderModel> orders;
  OrderSuccess(this.orders);
}

class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}


class OrderEmpty extends OrderState {}
