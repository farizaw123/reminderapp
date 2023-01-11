import 'package:flutter/material.dart';

class NavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFAFAF9F7),
      child: ListView(
        children: [
          Container(
            color: Colors.transparent,
            height: 85,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Text("School's Reminder", style: TextStyle(
              fontSize: 25,
              color: Color(0xFFFF735C)
            ),),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Semua Catatan'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            title: Text('kalender'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.alarm_outlined),
            title: Text('Pengingat'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Favorites'),
            onTap: () => null,
          ),

          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Sampah'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}