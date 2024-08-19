import 'package:flutter/material.dart';
import 'package:network_one/Widgets/Drawer.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Admin Dashboard'),
        ),
        drawer: Drawer(
          child: DrawerData(),
        )
    
        // body: Text('Wellcome to Admin Dashboard'),
        );
  }
}