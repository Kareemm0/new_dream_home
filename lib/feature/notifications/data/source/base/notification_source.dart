abstract class NotificationSource {
  Future<Map<String, dynamic>> getNotifications({
    required String userId,
  });
  Future<Map<String, dynamic>> addNotification({
    required String userId,
    required String message,
  });

  Future<Map<String, dynamic>> deleteNotification({
    required String id,
  });
}
