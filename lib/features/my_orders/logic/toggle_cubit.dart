import 'package:ecommerce_app/features/my_orders/logic/toggle_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleCubit extends Cubit<ToggleState> {
  ToggleCubit({required this.index}) : super(ToggleInitial());
  int index;
  void changeTab(int newIndex) {
    if(index==newIndex){
      emit(ToggleLoading());
      try {
        index = newIndex;
        emit(ToggleSuccess());
      } catch (e) {
        emit(ToggleFailure(message: e.toString()));
      }
    }

  }
}
