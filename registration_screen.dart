import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  String? resumePath;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final rollController = TextEditingController();

  final hscTotalController = TextEditingController();
  final hscOutOfController = TextEditingController();

  final sscTotalController = TextEditingController();
  final sscOutOfController = TextEditingController();

  final cgpa1Controller = TextEditingController();
  final cgpa2Controller = TextEditingController();
  final cgpa3Controller = TextEditingController();
  final cgpa4Controller = TextEditingController();

  void pickResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );
    if (result != null) {
      setState(() {
        resumePath = result.files.single.name;
      });
    }
  }

  void calculateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      double hscPercentage = (double.parse(hscTotalController.text) /
          double.parse(hscOutOfController.text)) *
          100;

      double sscPercentage = (double.parse(sscTotalController.text) /
          double.parse(sscOutOfController.text)) *
          100;

      double cgpaAvg = (double.parse(cgpa1Controller.text) +
          double.parse(cgpa2Controller.text) +
          double.parse(cgpa3Controller.text) +
          double.parse(cgpa4Controller.text)) /
          4;
      double percentageAvg = cgpaAvg * 9.5;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Registration Successful"),
            content: Text(
              "HSC Percentage: ${hscPercentage.toStringAsFixed(2)}%\n"
                  "SSC Percentage: ${sscPercentage.toStringAsFixed(2)}%\n"
                  "CGPA Average: ${cgpaAvg.toStringAsFixed(2)}\n"
                  "Equivalent Percentage: ${percentageAvg.toStringAsFixed(2)}%\n"
                  "Resume: ${resumePath ?? "Not Uploaded"}",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool isNumeric = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) return "Required field";
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField("Full Name", nameController),
              buildTextField("E-mail", emailController),
              buildTextField("Contact Number", contactController, isNumeric: true),
              buildTextField("Roll Number", rollController, isNumeric: true),

              SizedBox(height: 10),
              Text("HSC Details", style: TextStyle(fontWeight: FontWeight.bold)),
              buildTextField("Total Marks", hscTotalController, isNumeric: true),
              buildTextField("Out of", hscOutOfController, isNumeric: true),

              SizedBox(height: 10),
              Text("SSC Details", style: TextStyle(fontWeight: FontWeight.bold)),
              buildTextField("Total Marks", sscTotalController, isNumeric: true),
              buildTextField("Out of", sscOutOfController, isNumeric: true),

              SizedBox(height: 10),
              Text("CGPA for Semesters", style: TextStyle(fontWeight: FontWeight.bold)),
              buildTextField("Sem 1 CGPA", cgpa1Controller, isNumeric: true),
              buildTextField("Sem 2 CGPA", cgpa2Controller, isNumeric: true),
              buildTextField("Sem 3 CGPA", cgpa3Controller, isNumeric: true),
              buildTextField("Sem 4 CGPA", cgpa4Controller, isNumeric: true),

              SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: pickResume,
                icon: Icon(Icons.upload_file),
                label: Text("Upload Resume"),
              ),
              if (resumePath != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text("Uploaded: $resumePath",
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateAndSubmit,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

