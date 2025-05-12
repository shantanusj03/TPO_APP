import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'company_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TPO - SPIT Mumbai')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: Text('Register'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RegistrationScreen())),
            ),
            ListTile(
              title: Text('Company Details'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CompanyScreen())),
            ),
            ListTile(
              title: Text('Your Profile'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen())),
            ),
          ],
        ),
      ),
      body: Center(child: Text('Welcome to TPO App!', style: TextStyle(fontSize: 18))),
    );
  }
}
