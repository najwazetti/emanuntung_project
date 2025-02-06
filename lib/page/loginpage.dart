import 'package:flutter/material.dart';
import 'package:emanuntung_project/page/home.dart';
import 'package:emanuntung_project/page/regispage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;
  final TextEditingController nikController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.close, size: 30),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("eManuntung", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.blue)),
            SizedBox(height: 10),
            Text("Selamat datang di eManuntung👋",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Nikmati akses berbagai layanan di Balikpapan dalam satu genggaman!"),
            SizedBox(height: 30),

            // Input NIK
            Text("NIK"),
            TextField(
              controller: nikController,
              decoration: InputDecoration(
                hintText: "Masukkan NIK",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),

            // Input Password
            Text("Password"),
            TextField(
              controller: passwordController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Masukkan Password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: IconButton(
                  icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),

            // Tombol Masuk
            ElevatedButton(
              onPressed: nikController.text.isNotEmpty && passwordController.text.isNotEmpty
                  ? () {
                      print("Login dengan: ${nikController.text}, ${passwordController.text}");
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blue,
              ),
              child: Text("Masuk", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            SizedBox(height: 10),

            // Lupa Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text("Lupa Password?", style: TextStyle(color: Colors.blue)),
              ),
            ),

            Spacer(),

            // Syarat dan Ketentuan
            Center(
              child: Text("Dengan masuk ke eManuntung, kamu menyetujui segala"),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("Syarat dan Ketentuan", style: TextStyle(color: Colors.blue)),
                  ),
                  Text("dan"),
                  TextButton(
                    onPressed: () {},
                    child: Text("Kebijakan Privasi", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),

            // Daftar Akun
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Regispage(),
                    ),
                  );
                },
                child: Text("Belum punya akun? Daftar di sini.", style: TextStyle(color: Colors.blue)),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}