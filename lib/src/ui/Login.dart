import 'package:flutter/material.dart';

import 'package:frogs/src/ui/Whiteboard.dart';
import 'package:frogs/src/blocs/LoginBloc.dart';

const Color MAIN_COLOR = Color.fromRGBO(74, 220, 113, 1); // #4adc71

class Login extends StatelessWidget {

  static const ROUTE = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: LoginForm()
        )
    );
  }
}

class LoginForm extends StatefulWidget {

  @override
  State createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textFieldInputBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: MAIN_COLOR,
            width: 2
        )
    );

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  '¿Cómo te llamás?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w100, fontFamily: 'ZonaPro')
              ),
            ),

            SizedBox(height: 23),

            TextFormField(
                validator: (name) {
                  if (name == null || name.isEmpty) {
                    return 'Nombre requerido para continuar.';
                  }
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: textFieldInputBorder,
                    focusedBorder: textFieldInputBorder,
                    enabledBorder: textFieldInputBorder

                )
            ),

            SizedBox(height: 23),

            Container(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: MAIN_COLOR,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      LoginBLoc().loginFinished(_usernameTextController.text);
                      Navigator.pushNamed(context, Whiteboard.ROUTE);
                    }
                  },
                  child: Text(
                      'Continuar'
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
