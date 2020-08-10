import 'package:flutter/material.dart';

import 'constants.dart';

class ErrorMessage extends StatefulWidget {
  final String errorMessage;
  ErrorMessage({ this.errorMessage });

  @override
  _ErrorMessageState createState() => _ErrorMessageState();
}

class _ErrorMessageState extends State<ErrorMessage> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.errorMessage, 
      style: errorTextStyle
    );
  }
}