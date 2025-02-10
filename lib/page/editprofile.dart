import 'package:flutter/material.dart';
import 'package:emanuntung_project/page/profile.dart'; // Make sure to import profile.dart

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/userprofile.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.white),
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('NIK', style: TextStyle(fontSize: 14)),
            Text('1234567890123456', 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildTextField(label: 'Nama Depan', initialValue: 'Carlos'),
            _buildTextField(label: 'Nama Belakang', initialValue: 'Sainz'),
            _buildTextField(label: 'Email', initialValue: 'carlossainz@formula1.com'),
            _buildTextField(label: 'Nomor Telepon', initialValue: '081234567890'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14)),
        TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}