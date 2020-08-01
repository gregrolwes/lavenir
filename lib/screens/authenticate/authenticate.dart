import 'package:flutter/material.dart';
import 'package:lavenir/services/auth.dart';
import 'package:lavenir/shared/constants.dart';
import 'package:lavenir/shared/error.dart';
import 'package:lavenir/shared/loading.dart';
import 'package:lavenir/shared/submit_button.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String get _headerLabel {
    return showSignIn ? 'Register' : 'Sign In';
  }
  String get _submitLabel {
    return showSignIn ? 'Sign In' : 'Register';
  }
  String get _errorMessage {
    return showSignIn ? 'Invalid email or password' : 'Please supply a valid email';
  }

  Future submit() async {
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      dynamic result = showSignIn ? signIn() : register();
      if (result == null) {
        setState(() {
          error = _errorMessage;
          loading = false;
        });
      }
    }
  }
  Future register() async {
    return await _auth.register(email, password);
  }
  Future signIn() async {
    return await _auth.signIn(email, password);
  }

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        backgroundColor: green,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () { setState(() => showSignIn = !showSignIn); }, 
            icon: Icon(Icons.person, color: Colors.white,), 
            label: Text(_headerLabel, style: TextStyle(color: Colors.white,)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
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
                SubmitButton(submitFunction: submit, label: _submitLabel,),
                SizedBox(height: 12.0),
                ErrorMessage(errorMessage: error),
              ]
            ),
          ),
        ),
      ),
    );
  }
}