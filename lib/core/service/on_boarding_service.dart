import 'package:dream_home/core/cache/shred_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  Future<bool> isOnboardingShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(ShredKeys.open) ?? false;
  }

  Future<void> markOnboardingAsShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(ShredKeys.open, true);
  }
}
