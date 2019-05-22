import 'package:flutter/material.dart';

import 'package:frogs/src/ui/Whiteboard.dart';
import 'package:frogs/src/blocs/LoginBloc.dart';

const Color MAIN_COLOR = Color.fromRGBO(74, 220, 113, 1); // #4adc71

class Login extends StatefulWidget {

  static const ROUTE = "/";

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {

  bool _loggedIn;

  @override
  Widget build(BuildContext context) {
    Widget childWidget;
    if (_loggedIn == null || _loggedIn) {
      childWidget = getProgressIndicator();
    } else {
      childWidget = LoginForm();
    }

    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: childWidget
        )
    );
  }

  Widget getProgressIndicator() {
    return CircularProgressIndicator();
  }

  @override
  void initState() {
    LoginBLoc().userLoggedIn()
        .then((userName) {
            setState(() => _loggedIn = userName != null && userName != "");
            if (userName != null && userName != "") {
              Navigator.pushNamed(context, Whiteboard.ROUTE);
            }
          }
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
                controller: _usernameTextController,
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
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await LoginBLoc().loginFinished(_usernameTextController.text);
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
