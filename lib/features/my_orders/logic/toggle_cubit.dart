import 'package:ecommerce_app/features/my_orders/logic/toggle_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleCubit extends Cubit<ToggleState> {
  ToggleCubit({required this.index}) : super(ToggleInitial());
  int index;
  Future<void> toggle() async {
    try {
      emit(ToggleLoading());
      await Future.delayed(Duration(seconds: 2));
      index =
          index == 0
              ? 1
              : index == 1
              ? 2
              : 0;
      emit(ToggleSuccess(index: index));
    } catch (e) {
      emit(ToggleFailure(message: e.toString()));
    }
  }
}
