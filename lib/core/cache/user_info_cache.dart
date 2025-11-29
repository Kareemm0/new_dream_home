import 'dart:convert';
import 'dart:developer';
import 'package:dream_home/core/cache/shred_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../feature/auth/data/model/Login/login_model/login_model.dart';

Future<void> saveUserToSharedPreferences(LoginModel user,
    [Map<String, dynamic>? updates]) async {
  final prefs = await SharedPreferences.getInstance();

  final existingUserData = prefs.getString(ShredKeys.user);

  if (existingUserData != null) {
    final Map<String, dynamic> userMap = jsonDecode(existingUserData);

    if (updates != null) {
      userMap.addAll(updates);
    }

    await prefs.setString(ShredKeys.user, jsonEncode(userMap));
  } else {
    final newUser = user.toJson();

    if (updates != null) {
      newUser.addAll(updates);
    }

    await prefs.setString(ShredKeys.user, jsonEncode(newUser));
  }
}

Future<LoginModel?> getUserFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final userJson = prefs.getString(ShredKeys.user);
  if (userJson != null) {
    log("cached User Data $userJson");
    return LoginModel.fromJson(jsonDecode(userJson));
  }
  return null;
}

Future<void> clearUserData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(ShredKeys.user);
  log("Cache is Cleared");
}

Future<bool> hasRatingRequestBeenSent() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(ShredKeys.keyRatingRequestSent) ?? false;
}

Future<void> markRatingRequestAsSent() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(ShredKeys.keyRatingRequestSent, true);
}

Future<void> saveReviewId(String reviewId) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("reviewId", reviewId);
}

Future<String?> getReviewId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString("reviewId");
}

Future<void> saveReviewStatus(String reviewstatus) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("status", reviewstatus);
}

Future<String?> getReviewStaus() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString("status");
}

Future<bool> hasSentRatingRequest(String receiverId) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('rating_request_$receiverId') ?? false;
}

Future<void> markRatingRequestSent(String receiverId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('rating_request_$receiverId', true);
}
