import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:lavenir/screens/home/announcement_list.dart';
import 'package:lavenir/screens/home/schedule.dart';
import 'package:lavenir/screens/home/availability.dart';
import 'package:lavenir/services/auth.dart';
import 'package:lavenir/shared/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Availability(),
      AnnouncementList(),
      Schedule()
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "L'AVENIR",
          style: logoTextStyle,  
        ),
        backgroundColor: mainColor,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Ionicons.ios_log_out,
              color: headerTextColor,
            ),
            tooltip: 'Logout',
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text('Availability'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            title: Text('Announcements'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Schedule'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mainColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
