abstract class Endpoints {
  static const String baseUrl = 'https://nti-ecommerce-api-production-b859.up.railway.app/api/';
  static const String getUserData = 'get_user_data';
  static const String register = "register";
  static const String login = "login";
  static const String logout = "logout";
  static const String updateProfile = "update_profile";
  static const String addToFavorite = "add_to_favorite";
  static const String bestSeller = "best_seller_products";
  static const String topRated = "top_rated_products";
  static const String refreshToken = "refresh_token";

  //order
  static const String getOrders = 'orders';
  static const String placeOrder = 'place_order';
  static const String cancelOrder = 'orders/cancel/1';
  static const String completeOrder = 'orders/complete/3';
}