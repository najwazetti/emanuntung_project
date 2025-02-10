import 'package:flutter/material.dart';
import 'package:emanuntung_project/page/loginpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Regispage(),
  ));
}

class Regispage extends StatelessWidget {
  final TextEditingController nikController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/document.gif', // Ganti dengan gambar sesuai kebutuhan
                height: 150,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'eManuntung',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const Text(
              'Registrasi Akun Single Sign On',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildTextField(label: 'NIK', hint: 'Masukkan 16 Digit NIK Anda', controller: nikController),
            Text('NIK Wajib Valid dan Terdaftar di Disdukcapil sesuai KTP', style: TextStyle(fontSize: 12)),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(label: 'Nama Depan', hint: '', controller: firstNameController),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildTextField(label: 'Nama Belakang', hint: '', controller: lastNameController),
                ),
              ],
            ),
            _buildTextField(label: 'Email', hint: 'Contoh: emanuntung.balikpapan@gmail.com', controller: emailController),
            _buildTextField(label: 'Nomor Telp', hint: '081200000000', controller: phoneController),
            Text('Silahkan masukkan Nomor Telp yang terdaftar Whatsapp', style: TextStyle(fontSize: 12)),
            _buildPasswordField(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Registrasi', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text('Sudah memiliki Akun ? Masuk', style: TextStyle(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String hint, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(label, style: TextStyle(fontSize: 14)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text('Kata Sandi', style: TextStyle(fontSize: 14)),
        TextField(
          controller: passwordController,
          obscureText: !isPasswordVisible,
          decoration: InputDecoration(
            hintText: 'Kata Sandi',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIcon: IconButton(
              icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                isPasswordVisible = !isPasswordVisible;
              },
            ),
          ),
        ),
        const Text(
          'Kata Sandi harus mengandung huruf besar, kecil, angka dan simbol minimal 8 Karakter.',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
