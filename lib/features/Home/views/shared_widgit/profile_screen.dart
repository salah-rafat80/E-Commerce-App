import 'package:ecommerce_app/core/resources_manager/constant/images/images.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Profile")),
        automaticallyImplyLeading: false, // إزالة زر الرجوع
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // قسم معلومات المستخدم
            _buildUserInfo(),
            // قائمة الخيارات
            _buildProfileOptions(),
          ],
        ),
      ),
    );
  }

  // جزء معلومات المستخدم
  Widget _buildUserInfo() {
    return Container(
      padding:  EdgeInsets.all(20),
      child: Column(
        children: [
           CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppImages.Mens), // استبدل بمسار صورتك
          ),
          const SizedBox(height: 15),
          const Text(
            'User Name',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            'user@example.com',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // قائمة خيارات البروفايل
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

  // عنصر القائمة العام
  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: 28),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
      onTap: () {
        // أضف هنا التنقل للشاشة المطلوبة
      },
    );
  }

  // زر تسجيل الخروج
  Widget _buildLogoutTile() {
    return ListTile(
      leading: Icon(Icons.logout, color: Colors.red[400], size: 28),
      title: Text('Log Out',
          style: TextStyle(color: Colors.red[400], fontSize: 18)),
      onTap: () {
        // أضف هنا منطق تسجيل الخروج
      },
    );
  }


}