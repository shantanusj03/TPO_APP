import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  final List<Map<String, String>> companies = [
    {'name': 'Google', 'location': 'Bangalore', 'salary': '₹12-25 LPA', 'profile': 'Software Engineer'},
    {'name': 'Amazon', 'location': 'Hyderabad', 'salary': '₹10-20 LPA', 'profile': 'Data Analyst'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Company Details')),
      body: ListView.builder(
        itemCount: companies.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(companies[index]['name']!),
              subtitle: Text('${companies[index]['location']} • ${companies[index]['salary']}'),
              trailing: Text(companies[index]['profile']!),
            ),
          );
        },
      ),
    );
  }
}
