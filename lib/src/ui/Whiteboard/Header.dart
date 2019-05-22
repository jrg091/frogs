import 'package:flutter/material.dart';

import 'package:frogs/src/blocs/DishesBloc.dart';

const Color MAIN_COLOR = Color.fromRGBO(220, 74, 113, 1); // #4adc71

class Header extends StatelessWidget {

  DishesBloc _bloc = DishesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Text(
            "Hola Jorge!"
          ),

          //https://www.flaticon.com/free-icon/chef-hat_45207
          Image(
              image: AssetImage("assets/icons/chef_hat.png"),
              height: 16,
              width: 16
          )
        ],
      )
    );
  }
}

