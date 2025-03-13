class AppLinks {
  //

  static const String serverLink = "http://10.0.2.2:8000";
  // static const String serverLink = "https://aymanbld.kesug.com/ecommerce";

  //--------auth---------------------------------------------------------------

  // static const String logout = "$serverLink/auth/logout/";
  static const String login = "$serverLink/auth/login/";
  static const String signup = "$serverLink/auth/registration/";
  static const String checkCode = "$serverLink/auth/verify/";
  static const String resendCode = "$serverLink/auth/resend-email/";
  static const String checkEmail = "$serverLink/auth/password/forget/";
  static const String resetPassword = "$serverLink/auth/password/reset/";

  //--------home---------------------------------------------------------

  static const String home = "$serverLink/home/home"; // !!!!! not yet
  static const String dealProducts = "$serverLink/products/deals/";
  static const String productsByCategory = "$serverLink/products/category/"; //  category/<int>
  static const String search = "$serverLink/products/search/";
  static const String category = "$serverLink/category/";

  //--------favorite---------------------------------------------------------

  static const String manageFav = "$serverLink/favorite/"; // favorite/<int>/

  //-------------cart--------------------------------------------------------

  static const String getCart = "$serverLink/cart/";
  static const String updateRemoveCart = "$serverLink/cart/"; // cart/<int>/
  static const String addCart = "$serverLink/cart/add/";
  static const String checkCoupon = "$serverLink/cart/coupon/";

  //------------orders---------------------------------------------------------

  static const String creatOrder = "$serverLink/orders/";
  static const String order = "$serverLink/orders/"; // orders/<int>/
  static const String getActiveOrders = "$serverLink/orders/active/";
  static const String getArchiveOrders = "$serverLink/orders/archive/";

  //-------------address---------------------------------------------------------

  static const String getAdrdress = "$serverLink/address/";
  static const String addres = "$serverLink/address/"; // address/<int>/
}
