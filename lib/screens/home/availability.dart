import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lavenir/models/availability_model.dart';
import 'package:lavenir/models/day.dart';
import 'package:lavenir/models/session.dart';
import 'package:lavenir/screens/home/availability_card.dart';

import 'package:lavenir/shared/constants.dart';
import 'package:lavenir/services/database.dart';
import 'package:provider/provider.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  @override
  Widget build(BuildContext context) {
    return AvailabilityCard();
  }
}
