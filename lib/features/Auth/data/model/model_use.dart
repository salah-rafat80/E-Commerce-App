class UserModel {
  String? accessToken;
  String? refreshToken;
  bool? status;
  User? user;

  UserModel({this.accessToken, this.refreshToken, this.status, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? email;
  List<dynamic>? favoriteProducts;
  int? id;
  String? imagePath;
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
    return {
      'email': email,
      'favorite_products': favoriteProducts ?? [],
      'id': id,
      'image_path': imagePath,
      'name': name,
      'phone': phone,
    };
  }
}

