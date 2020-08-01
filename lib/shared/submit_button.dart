import 'package:flutter/material.dart';
import 'package:lavenir/shared/constants.dart';

class SubmitButton extends StatefulWidget {
  final Function submitFunction;
  final String label;
  SubmitButton({ this.submitFunction, this.label });

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: green,
      onPressed: () async { widget.submitFunction(); },
      child: Text(
        widget.label,
        style: TextStyle(color: Colors.white),
      )
    );
  }
}
