class EndPoints {
  static const String baseurl = "https://grad-project-seven.vercel.app/api";
  static const String login = "/user/login";
  static const String register = "/user/signup";
  static String getNotifications(String userId) => "/notification/user/$userId";
  static String deleteNotification(String id) => "/notification/delete/$id";
  static String addNotification = "/notification/add";
  static String getWorker = "/user/getEmployees";
  static String updateProfile(String id) => "/user/update/$id";
  static String getUserInfo(String id) => "/user/profile/$id";
  static String getAllChats(String userId) => "/chat/all-chats/$userId";
  static String getChatMessages = "/chat/get-chat";
  static String sendMessage = "/chat/create";
  static String requestReview = "/review/request";
  static String updateReview = "/review/update-review";
  static String getReviews(String id) => "/review/$id";
}
