import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  final String vUserName = "username";
  final String vUserEmail = "email";

  Future<void> setSaveLogInDataToSharedPreference(
      String userName, String userEmail) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(vUserName, userName);
    preferences.setString(vUserEmail, userEmail);
  }

  Future<void> setSaveUserNameToSharedPreference(String userName) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(vUserName, userName);
  }

  Future<void> setDeleteDataToSharedPreferences() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  Future<String> getName() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(vUserName)!;
  }

  Future<String> getEmail() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString(vUserEmail)!;
    return email;
  }
}
