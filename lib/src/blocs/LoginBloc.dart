
import 'dart:async';

import 'package:frogs/src/resources/Repository.dart';

class LoginBLoc {
  Future<void> loginFinished(String username) async {
    await Repository.saveName(username);
  }

  Future<String> userLoggedIn() async {
    return await Repository.getName();
  }
}