import 'home.dart';
import 'profile.dart';
import 'riwayatpage.dart';
import 'notifikasipage.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Riwayat(),
    NotifikasiPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Menampilkan halaman yang sesuai
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/home.gif', width: 24, height: 24),
            label: 'Home', 
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/riwayat.gif', width: 24, height: 24),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/notif.gif', width: 24, height: 24),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/profile.gif', width: 24, height: 24),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}