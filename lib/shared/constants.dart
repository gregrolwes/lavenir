import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//color palette
const yellow = Color.fromRGBO(251, 243, 225, 1);
const green =  Color.fromRGBO(233, 138, 28, 1);
const darkGreen = Color.fromRGBO(215, 121, 5, 1);

const mainColor = green;
const backgroundColor = yellow;

const headerTextColor = Colors.white;
const submitButtonTextStyle = TextStyle(color: Colors.white);
const errorTextStyle = TextStyle(color: Colors.red, fontSize: 14.0);
const headerTextStyle = TextStyle(color: headerTextColor,);
var logoTextStyle = GoogleFonts.montserrat(
  letterSpacing: 2.5,
);

const emailInputDecoration = InputDecoration(
  hintText: 'Email',
);

const passwordInputDecoration = InputDecoration(
  hintText: 'Password',
);

final boxShadow = BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        );

const cardMargin = EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5);