
import '../../data/model/best_selleing_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  String message;
  HomeError({required this.message});
}

class HomeSuccess extends HomeState {

  List<BestSellingModel> BestSelleing;
  HomeSuccess({required this.BestSelleing});
}