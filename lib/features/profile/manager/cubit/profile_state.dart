import 'package:ecommerce_app/features/Auth/data/model/model_use.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileDataSuccess extends ProfileState {
  List<UserModel> UserdataList;
  ProfileDataSuccess({required this.UserdataList});
}

class ProfileDataError extends ProfileState {
  String message;
  ProfileDataError({required this.message});
}

class ProfileDataLoading extends ProfileState {}