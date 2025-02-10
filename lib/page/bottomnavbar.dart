import 'home.dart';
import 'profile.dart';
import 'riwayatpage.dart';
import 'notifikasipage.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  bool _isAppActive = true; // Menentukan apakah aplikasi sedang aktif

  final List<Widget> _pages = [
    HomePage(),
    Riwayat(),
    NotifikasiPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Tambahkan observer
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Hapus observer saat widget dihancurkan
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _isAppActive = state == AppLifecycleState.resumed;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isAppActive ? _pages[_selectedIndex] : _buildSkeletonLoading(_selectedIndex),
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

  /// **Menampilkan Skeleton Sesuai Halaman yang Dipilih**
  Widget _buildSkeletonLoading(int index) {
    switch (index) {
      case 0:
        return _buildHomeSkeleton();
      case 1:
        return _buildRiwayatSkeleton();
      case 2:
        return _buildNotifikasiSkeleton();
      case 3:
        return _buildProfileSkeleton();
      default:
        return _buildHomeSkeleton();
    }
  }

  /// **Skeleton untuk HomePage**
  Widget _buildHomeSkeleton() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        // Skeleton Banner
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(height: 20),
        // Skeleton List
        ...List.generate(4, (index) => _buildListItemSkeleton()),
      ],
    );
  }

  /// **Skeleton untuk RiwayatPage**
  Widget _buildRiwayatSkeleton() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) => _buildListItemSkeleton(),
    );
  }

  /// **Skeleton untuk NotifikasiPage**
  Widget _buildNotifikasiSkeleton() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (context, index) => _buildNotifItemSkeleton(),
    );
  }

  /// **Skeleton untuk ProfilePage**
  Widget _buildProfileSkeleton() {
    return Column(
      children: [
        SizedBox(height: 40),
        // Skeleton Avatar
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        // Skeleton Info Profil
        _buildTextSkeleton(width: 150, height: 20),
        SizedBox(height: 10),
        _buildTextSkeleton(width: 100, height: 15),
        SizedBox(height: 30),
        // Skeleton List Menu
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            itemBuilder: (context, index) => _buildListItemSkeleton(),
          ),
        ),
      ],
    );
  }

  /// **Item Skeleton List**
  Widget _buildListItemSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  /// **Item Skeleton Notifikasi**
  Widget _buildNotifItemSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextSkeleton(width: double.infinity, height: 20),
                SizedBox(height: 5),
                _buildTextSkeleton(width: 200, height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// **Skeleton Text dengan Panjang dan Lebar Dinamis**
  Widget _buildTextSkeleton({double width = 100, double height = 20}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
