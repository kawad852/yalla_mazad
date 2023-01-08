class ApiUrl {
  static const String mainUrl = "https://admin.yallamzad.com";

  //introduction
  static const String introduction = "/api/v1/introductions";

  //sign in
  static const String signIn = "/api/v1/login";

  //social login
  static const String socialLogin = "/api/v1/sociallogin";

  //register
  static const String register = "/api/v1/user-reg";

  //otp check
  static const String otpCheck = "/api/v1/otp-check";

  //update user phone
  static const String updateUserPhone = "/api/v1/phone-update/";

  //update user
  static const String updateUser = "/api/v1/user-update";

  //resend otp
  static const String resendOtp = "/api/v1/resend-otp/";

  //get all interests
  static const String fetchAllInterests = "/api/v1/categories";

  //get all plans
  static const String fetchAllPlans = "/api/v1/plans";

  //get all categories
  static const String fetchAllCategories = "/api/v1/categories";

  //get all sliders
  static const String fetchAllSliders = "/api/v1/sliders";

  //add auction
  static const String addAuction = "/api/v1/advertisement-create";

  //get popular ads
  static const String fetchAllPopularAds = "/api/v1/popular-advertisements/";

  //get my subscription
  static const String fetchMySubscription = "/api/v1/my-subscriptions/";

  //get all ads
  static const String fetchAllAds = "/api/v1/advertisements";

  //get my favorites
  static const String fetchMyFavorites = "/api/v1/my-favorites";

  //get my ads
  static const String fetchMyAds = "/api/v1/my-advertisements";

  //get ad details (view)
  static const String fetchAdDetails = "/api/v1/advertisement/";

  //get ads by category
  static const String fetchAdsByCategory =
      "/api/v1/advertisement/get-advertisements/";

  //add advertisement to favorites
  static const String addAdvertisementToFavorites = "/api/v1/favorite-create";

  //delete advertisement from favorites
  static const String deleteAdvertisementFromFavorites =
      "/api/v1/favorite/delete/";

  //search advertisement
  static const String searchAdvertisement = "/api/v1/advertisements/search";

  //forgot password step 1
  static const String forgotPasswordOtp = "/api/v1/password-otp";

  //forgot password step 3
  static const String forgotPasswordChange = "/api/v1/change-password";

  // add categories to user
  static const String addCategoriesToUser = "/api/v1/add-categories";

  //get all tips
  static const String fetchAllTips = "/api/v1/tips";

  //get my badges
  static const String fetchMyBadges = "/api/v1/my-badges";

  //get my badges
  static const String changePassword = "/api/v1/update-password";

  //get my notifications
  static const String fetchMyNotifications = "/api/v1/my-notifications";
}
