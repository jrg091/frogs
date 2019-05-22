import 'package:flutter/material.dart';

import 'package:frogs/src/ui/Whiteboard/Header.dart';
import 'package:frogs/src/ui/Whiteboard/Menu.dart';
import 'package:frogs/src/ui/Whiteboard/WeekMenu.dart';

const Color MAIN_COLOR = Color.fromRGBO(220, 74, 113, 1); // #4adc71

class Whiteboard extends StatelessWidget {

  static const ROUTE = "/whitboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Scaffold(
            body: Column(
              children: <Widget>[
                Header(),
                Menu(),

                Divider(color: Color.fromARGB(255, 216, 216, 216)),

                WeekMenu()
              ],
            )
          )
      )
    );
  }
}
