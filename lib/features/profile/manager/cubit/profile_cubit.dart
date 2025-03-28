import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/Auth/data/model/model_use.dart';
import 'package:ecommerce_app/features/profile/data/repo/profile_repo.dart';
import 'package:ecommerce_app/features/profile/manager/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getProfile() async {
    try {
      print("🔄 بدأ تحميل البيانات...");
      emit(ProfileDataLoading());

      Either<String, List<UserModel>> result = await ProfileRepo.getinstance().UserData(); // ✅ استدعاء كـ Method

      result.fold(
            (failureMessage) {
          print("❌ فشل في جلب البيانات: $failureMessage");
          emit(ProfileDataError(message: failureMessage));
        },
            (userDataList) {
          if (userDataList.isEmpty || userDataList[0].user == null) {
            print("⚠️ لا توجد بيانات مستخدم");
            emit(ProfileDataError(message: "لا توجد بيانات مستخدم متاحة"));
            return;
          }
          print("✅ تم تحميل البيانات بنجاح: ${userDataList.length} مستخدم(ين)");
          emit(ProfileDataSuccess(UserdataList: userDataList));
        },
      );
    } catch (e) {
      print("⚠️ حدث خطأ غير متوقع: $e");
      emit(ProfileDataError(message: "حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }

}
