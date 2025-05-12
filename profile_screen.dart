import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, String> studentDetails = {
    'Name': 'Shantanu Joshi',
    'Roll No': '21BCS101',
    'E-mail': 'shantanu@spit.ac.in',
    'Contact': '+91 9876543210',
    'College': 'SPIT Mumbai',
    'CGPA': '8.9',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: studentDetails.entries.map((entry) {
            return Card(
              child: ListTile(
                title: Text(entry.key),
                subtitle: Text(entry.value),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
