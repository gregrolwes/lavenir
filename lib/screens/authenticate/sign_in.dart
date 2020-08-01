import 'package:flutter/material.dart';
import 'package:lavenir/services/auth.dart';
import 'package:lavenir/shared/constants.dart';
import 'package:lavenir/shared/error.dart';
import 'package:lavenir/shared/loading.dart';
import 'package:lavenir/shared/submit_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  Future signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      dynamic result = await _auth.signIn(email, password);
      if (result == null) {
        setState(() {
          error = 'Invalid email or password';
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Image(image: AssetImage('assets/logo_main.png')),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: emailInputDecoration,
            validator: (val) => val.isEmpty ? 'Enter an email' : null,
            onChanged: (val) {
              setState(() => email = val);
            }
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: passwordInputDecoration,
            obscureText: true,
            validator: (val) => val.length < 6 ? 'Password must be at least 6 characters' : null,
            onChanged: (val) {
              setState(() => password = val);
            },
          ),
          SizedBox(height: 20.0),
          SubmitButton(submitFunction: signIn, label: 'Sign In',),
          SizedBox(height: 12.0),
          ErrorMessage(errorMessage: error),
        ]
      ),
    );
  }
}