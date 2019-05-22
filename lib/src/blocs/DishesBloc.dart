
import 'dart:async';
import 'package:frogs/src/resources/Repository.dart';

class DishesBloc {

  Future<String> getUsername() async {
    return await Repository.getName();
  }

}