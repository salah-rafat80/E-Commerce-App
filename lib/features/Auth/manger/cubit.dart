import 'package:ecommerce_app/features/Auth/data/model/model_use.dart';
import 'package:ecommerce_app/features/Auth/data/repo/repo_auth.dart';
import 'package:ecommerce_app/features/Auth/manger/state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(RegisterInitState());

  AuthCubit._internal() : super(RegisterInitState());
  static AuthCubit _instance = AuthCubit._internal();
  static AuthCubit getinstance() {
    return _instance;
  }

  static AuthCubit get(context) => BlocProvider.of(context);

  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();

  bool isPasswordVisible = false;
  bool isPasswordVisibleconfirm = false;
  // OnBordingRebo onBordingRebo = OnBordingRebo();
  TextEditingController emailLoginController = TextEditingController();

  TextEditingController passwordLoginController = TextEditingController();

  AuthRepo authRepo =
      AuthRepo(); // Replace 'namedConstructor' with the actual named constructor of AuthRepo

  Future<void> register() async {
    emit(RegisterLodinState());

    var result = await authRepo.register(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneController.text);

    result.fold((String error) {
      emit(RegisterErorrState(error: error));
    }, (r) {
      emit(RegisterScuessState(message: r));
      // print('register sucess');
    });
  }

  Future<void> login() async {
    try {
      emit(LoginLodinState());

      final result = await authRepo.login(
        email: emailLoginController.text.trim(),
        password: passwordLoginController.text.trim(),
      );
      print(emailLoginController.text);
      print(passwordLoginController.text);

      result.fold(
        (String error) {
          emit(LoginErorrState(error: error));
        },
        (User user) {
          emit(LoginScuessState(
              user: user)); // تمرير بيانات المستخدم إذا لزم الأمر
        },
      );
    } catch (e) {
      emit(LoginErorrState(error: 'Unexpected error: $e'));
    }
  }

  // void showPassword() {
  //   isPasswordVisible = !isPasswordVisible;
  // }
}
