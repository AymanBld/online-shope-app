class AppLinks {
  //

  static const String serverLink = "http://10.0.2.2";
  // static const String serverLink = "https://aymanbld.kesug.com/ecommerce";

  //--------auth---------------------------------------------------------------

  static const String login = "$serverLink/auth/login/";
  static const String signup = "$serverLink/auth/registration/";
  // static const String verifyCodeSignup = "$serverLink/auth/verify_code_signup";
  // static const String verifyCodeReset = "$serverLink/auth/verify_code_reset";
  // static const String resendCode = "$serverLink/aut  h/resend_code";
  // static const String checkEmail    = "$serverLink/auth/check_email";
  // static const String resetPassword = "$serverLink/auth/reset_password";
  static const String verifyCodeSignup = "$serverLink/auth/verify_code_signup";
  static const String verifyCodeReset = "$serverLink/auth/verify_code_reset";
  static const String resendCode = "$serverLink/auth/resend_code";
  static const String checkEmail = "$serverLink/auth/check_email";
  static const String resetPassword = "$serverLink/auth/reset_password";

  //--------home---------------------------------------------------------

  static const String home = "$serverLink/home/home"; // !!!!! not yet
  static const String dealProducts = "$serverLink/products/deals/";
  static const String search = "$serverLink/products/search/";

  //--------favorite---------------------------------------------------------

  static const String getFavs = "$serverLink/favorite/";
  static const String manageFav = "$serverLink/favorite/"; // favorite/<int>/
  // static const String removFav = "$serverLink/favorite/remove_fav";

  //-------------cart--------------------------------------------------------

  static const String getCart = "$serverLink/cart/";
  static const String updateRemoveCart = "$serverLink/cart/"; // cart/<int>/
  static const String addCart = "$serverLink/cart/add/";
  static const String checkCoupon = "$serverLink/cart/coupon/";

  //------------orders---------------------------------------------------------

  static const String creatOrder = "$serverLink/orders/";
  static const String order = "$serverLink/orders/";  // orders/<int>/
  static const String getActiveOrders = "$serverLink/orders/active/";
  static const String getArchiveOrders = "$serverLink/orders/archive/";

  //-------------address---------------------------------------------------------

  static const String getAdrdress = "$serverLink/address/";
  static const String addres = "$serverLink/address/";  // address/<int>/
}
