// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:network_one/Auth/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerData extends StatefulWidget {
  const DrawerData({super.key});

  @override
  State<DrawerData> createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  var name = '', email = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name')!;
    email = prefs.getString('email')!;
    setState(() {});
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(LoginPage());
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/premium-vector/man-professional-business-casual-young-avatar-icon-illustration_1277826-631.jpg?w=740"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      name.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      email.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                ),
              ),
              GestureDetector(
                child: Card(
                  child: ListTile(
                    title: Text('User List'),
                    leading: Icon(Icons.list_sharp),
                  ),
                ),
                onTap: () {
               
                },
              ),
              GestureDetector(
                child: Card(
                  child: ListTile(
                    title: Text('Categories'),
                    leading: Icon(Icons.category),
                  ),
                ),
                onTap: () {
            
                },
              ),
              GestureDetector(
                child: Card(
                  child: ListTile(
                    title: Text('Dishes'),
                    leading: Icon(Icons.dialpad_sharp),
                  ),
                ),
                onTap: () {
             
                },
              ),
              Card(
                child: ListTile(
                  title: Text('Setting'),
                  leading: Icon(Icons.settings),
                ),
              ),
              GestureDetector(
                child: Card(
                  child: ListTile(
                    title: Text('Log Out'),
                    leading: Icon(Icons.logout),
                  ),
                ),
                onTap: () {
                    logout();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
