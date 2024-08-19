import 'package:flutter/material.dart';
import 'package:network_one/Widgets/Drawer.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('User Dashboard'),
        ),
        drawer: Drawer(
          child: DrawerData(),
        )
    
        // body: Text('Wellcome to Admin Dashboard'),
        );
  }
}