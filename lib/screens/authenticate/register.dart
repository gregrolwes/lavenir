import 'package:lavenir/services/auth.dart';
import 'package:lavenir/shared/constants.dart';
import 'package:lavenir/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

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
            onPressed: () { widget.toggleView(); }, 
            icon: Icon(Icons.person, color: Colors.white,), 
            label: Text('Sign In', style: TextStyle(color: Colors.white,)),
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
                RaisedButton(
                  color: green,
                  onPressed: () async { 
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.register(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Please supply a valid email';
                          loading = false;
                        });
                      }
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  )
                ),
                SizedBox(height: 12.0),
                Text(
                  error, 
                  style: TextStyle(color: Colors.red, fontSize: 14.0)
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}