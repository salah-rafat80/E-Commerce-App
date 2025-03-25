class UserModel {
  bool? status;
  User? user;

  UserModel({this.status, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? email;
  List<dynamic>? favoriteProducts; // تغيير من List<Null> إلى List<dynamic>
  int? id;
  String? imagePath; // تغيير من Null إلى String?
  String? name;
  String? phone;

  User({
    this.email,
    this.favoriteProducts,
    this.id,
    this.imagePath,
    this.name,
    this.phone,
  });

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    favoriteProducts = json['favorite_products'] ?? [];
    id = json['id'];
    imagePath = json['image_path'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['favorite_products'] = favoriteProducts;
    data['id'] = id;
    data['image_path'] = imagePath;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
