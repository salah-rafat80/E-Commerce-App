import 'package:ecommerce_app/features/Auth/data/model/model_use.dart';

abstract class AuthState {}

// Register States
class RegisterInitState extends AuthState {}

class RegisterLodinState extends AuthState {}

class RegisterScuessState extends AuthState {
  String message;
  RegisterScuessState({required this.message});
}

class RegisterErorrState extends AuthState {
  String error;
  RegisterErorrState({required this.error});
}

// Loding States
class LoginLodinState extends AuthState {}

class LoginScuessState extends AuthState {
  final User user;

  LoginScuessState({required this.user});
}

class LoginErorrState extends AuthState {
  String error;
  LoginErorrState({required this.error});
}
