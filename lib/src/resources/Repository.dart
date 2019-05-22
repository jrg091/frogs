
import 'package:shared_preferences/shared_preferences.dart';

class Repository {

  static const String USERNAME_KEY = "username";

  static void saveName(String user) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(USERNAME_KEY, user);
  }

  static Future<String> getName() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(USERNAME_KEY);
  }

  static void removeName() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(USERNAME_KEY);
  }
}