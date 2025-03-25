import 'package:ecommerce_app/features/profile/manager/cubit/profile_cubit.dart';
import 'package:ecommerce_app/features/profile/manager/cubit/profile_state.dart';
import 'package:ecommerce_app/features/profile/widgt/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(), // ✅ التأكد من تحميل البيانات عند بدء الشاشة
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Profile")),
          automaticallyImplyLeading: false, // إزالة زر الرجوع
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileDataLoading) {
                    return const Center(child: CircularProgressIndicator()); // ✅ عرض اللودينج عند تحميل البيانات
                  } else if (state is ProfileDataSuccess) {
                    // ✅ التحقق مما إذا كانت القائمة فارغة
                    if (state.UserdataList.isEmpty || state.UserdataList[0].user == null) {
                      return const Center(child: Text("❌ لا توجد بيانات متاحة"));
                    }

                    var user = state.UserdataList[0].user!;

                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          ProfileImagePicker(),
                          const SizedBox(height: 15),
                          Text(
                            user.name ?? "Unknown User",
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            user.email ?? "user@example.com",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    );
                  } else if (state is ProfileDataError) {
                    return Center(
                      child: Text("❌ خطأ: ${state.message}"),
                    );
                  }

                  return const Center(child: Text("⚠️ لم يتم تحميل البيانات بعد"));
                },
                listener: (context, state) {
                  if (state is ProfileDataError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("⚠️ خطأ: ${state.message}")),
                    );
                  }
                },
              ),
              _buildProfileOptions(),
            ],
          ),
        ),
      ),
    );
  }

  // قائمة الخيارات
  Widget _buildProfileOptions() {
    return Column(
      children: [
        _buildListTile('My Profile', Icons.person_outline),
        _buildListTile('My Orders', Icons.shopping_bag_outlined),
        _buildListTile('My Favorites', Icons.favorite_border),
        _buildListTile('Settings', Icons.settings_outlined),
        _buildLogoutTile(),
      ],
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: 28),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
      onTap: () {},
    );
  }

  Widget _buildLogoutTile() {
    return ListTile(
      leading: Icon(Icons.logout, color: Colors.red[400], size: 28),
      title: Text('Log Out', style: TextStyle(color: Colors.red[400], fontSize: 18)),
      onTap: () {},
    );
  }
}
