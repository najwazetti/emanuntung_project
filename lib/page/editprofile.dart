import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EditProfilePage(),
  ));
}

class EditProfilePage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController(text: 'Carlos');
  final TextEditingController lastNameController = TextEditingController(text: 'Sainz');
  final TextEditingController emailController = TextEditingController(text: 'carlossainz@formula1.com');
  final TextEditingController phoneController = TextEditingController(text: '081234567890');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // Simpan perubahan
              print('Nama Depan: ${firstNameController.text}');
              print('Nama Belakang: ${lastNameController.text}');
              print('Email: ${emailController.text}');
              print('Nomor Telepon: ${phoneController.text}');
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
                    backgroundImage: AssetImage('assets/profile_picture.jpg'), // Ganti dengan gambar sesuai kebutuhan
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.white),
                      onPressed: () {
                        // Aksi untuk mengubah foto
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('NIK', style: TextStyle(fontSize: 14)),
            Text('1234567890123456', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildTextField(label: 'Nama Depan', controller: firstNameController),
            _buildTextField(label: 'Nama Belakang', controller: lastNameController),
            _buildTextField(label: 'Email', controller: emailController),
            _buildTextField(label: 'Nomor Telepon', controller: phoneController),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}