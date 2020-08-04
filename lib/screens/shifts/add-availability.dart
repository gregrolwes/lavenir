import 'package:lavenir/models/user.dart';
import 'package:lavenir/screens/wrapper.dart';
import 'package:lavenir/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAvailability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Add Availibity'),
    ));
  }
}
