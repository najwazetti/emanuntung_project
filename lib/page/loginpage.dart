import 'package:flutter/material.dart';
import 'package:emanuntung_project/page/regispage.dart';
import 'package:emanuntung_project/page/bottomnavbar.dart';

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
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    nikController.addListener(_validateInput);
    passwordController.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      isButtonEnabled =
          nikController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    nikController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, size: 30),
                    onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => MainScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "eManuntung",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const SizedBox(height: 10),
              const Text(
                "Selamat datang di eManuntung👋",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                  "Nikmati akses berbagai layanan di Balikpapan dalam satu genggaman!"),
              const SizedBox(height: 30),

              // Input NIK
              const Text("NIK"),
              TextField(
                controller: nikController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Masukkan NIK",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),

              // Input Password
              const Text("Password"),
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Masukkan Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Masuk
              ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        print(
                            "Login dengan: ${nikController.text}, ${passwordController.text}");
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainScreen()), // Masuk ke halaman utama tanpa tombol back
                                  (Route<dynamic> route) => false,
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                ),
                child: const Text("Masuk",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(height: 10),

              // Lupa Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Lupa Password?",
                      style: TextStyle(color: Colors.blue)),
                ),
              ),

              const SizedBox(height: 200),

              // Syarat dan Ketentuan
              Center(
                child: Column(
                  children: [
                    const Text(
                        "Dengan masuk ke eManuntung, kamu menyetujui segala"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("Syarat dan Ketentuan",
                              style: TextStyle(color: Colors.blue)),
                        ),
                        const Text("dan"),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Kebijakan Privasi",
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Daftar Akun
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Regispage()),
                    );
                  },
                  child: const Text("Belum punya akun? Daftar di sini.",
                      style: TextStyle(color: Colors.blue)),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
