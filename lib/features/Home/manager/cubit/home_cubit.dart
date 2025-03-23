import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/best_selleing_model.dart';
import '../../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getBestSelleing() async {
    try {
      print("🔄 بدأ تحميل البيانات...");
      emit(HomeLoading());
      await Future.delayed(Duration(seconds: 2));

      Either<String, List<BestSellingModel>> result = await HomeRepo.getinstance().bestSeller();

      result.fold(
            (failure) {
          print("❌ فشل في جلب البيانات: $failure");
          emit(HomeError(message: failure));
        },
            (BestSelleing) {
          print("✅ تم جلب البيانات بنجاح، عدد المنتجات: ${BestSelleing.length}");
          emit(HomeSuccess(BestSelleing: BestSelleing));
        },
      );
    } catch (e) {
      print("⚠️ حدث خطأ غير متوقع: $e");
      emit(HomeError(message: "حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }


}