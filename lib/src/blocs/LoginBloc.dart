
import 'package:frogs/src/resources/Repository.dart';

class LoginBLoc {
  void loginFinished(String username) {
    Repository.saveName(username);
  }

  Future<String> userLoggedIn() async {
    await Repository.getName();
  }
}