final String baseUrl = "https://digiyugsolution.com/admin/";

class EndPoints {
  // Auth module api

  static String sendOtp = "api/auth/send-otp.php";
  static String verifyOtp = "api/auth/verify-otp.php";
  static String resendOtp = "api/auth/resend-otp.php";

  // select lan api
  static String selectLanguage = "api/dashboard/select-language.php";

  // Dashboard api
  static String homeDashboard = "api/dashboard/dashboard.php";

  // on spot banner
  static String onSpotBanner = "api/settings/onspot-banner.php";

  // profile api
  static String faqFetch = "api/settings/get-faq.php";
  static String faqSend = "api/settings/add-faq.php";
  static String feedbackSend = "api/settings/feedback.php";
  static String editProfile = "api/settings/api/settings/edit-profile.php";
  static String getProfile = "api/settings/get-profile.php";
}
