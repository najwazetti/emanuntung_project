import 'dart:async';
import '../widget/berita.dart';
import '../widget/layananKhusus.dart';
import 'package:flutter/material.dart';
import 'package:emanuntung_project/page/search.dart';
import 'package:emanuntung_project/page/lainnya.dart';
import 'package:emanuntung_project/page/imagepath.dart';
import 'package:emanuntung_project/page/loginpage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'assets/balikpapan1.jpg',
    'assets/balikpapan2.jpg',
    // 'assets/city3.jpeg',
    // 'assets/city4.jpeg',
  ];

  final List<Map<String, String>> cards = [
    {
      'image': 'assets/berita1.png',
      'title':
          'Balikpapan Kembangkan 11 Sekolah Rujukan Google, Siapkan Generasi Digital',
      'subtitle': '18 Januari 2025',
      'category': 'News'
    },
    {
      'image': 'assets/berita2.png',
      'title':
          'Pengembangan Griya Rudiana Asri Laporkan 8 Orang ke Polda Kaltim',
      'subtitle': '18 Januari 2025',
      'category': 'News'
    },
    {
      'image': 'assets/berita3.png',
      'title':
          'Wali Kota Balikapapan Dukung Proyek Tol Bandara SAMS Sepinggan-IKN',
      'subtitle': '18 Januari 2025',
      'category': 'News'
    },
    {
      'image': 'assets/berita4.png',
      'title':
          '2 Tahun Jadi DPO Korupsi, Mantan Kades di Mojokerto Jadi Sopir di Balikpapan, Rugikan Negara Rp 120 Juta',
      'subtitle': '18 Januari 2025',
      'category': 'News'
    },
    {
      'image': 'assets/berita4.png',
      'title':
          '2 Tahun Jadi DPO Korupsi, Mantan Kades di Mojokerto Jadi Sopir di Balikpapan, Rugikan Negara Rp 120 Juta',
      'subtitle': '18 Januari 2025',
      'category': 'News'
    }
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        if (_currentPage < images.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.sizeOf(context).height * 0.2,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImagePathPage(),
                            ),
                          );
                        },
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 5,
                    left: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.search,
                                    color: Colors.grey[600], size: 24),
                                const SizedBox(width: 12),
                                Text(
                                  'Cari Layanan di eManuntung?',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              delegate: SliverChildListDelegate([
                _buildServiceItem('assets/kependudukan.gif', 'Kependudukan',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }),
                _buildServiceItem('assets/kelurahan.gif', 'Kelurahan', () {}),
                _buildServiceItem(
                    'assets/tenagakerja.gif', 'Tenaga Kerja', () {}),
                _buildServiceItem('assets/pajak.gif', 'Pajak', () {}),
                _buildServiceItem('assets/jdih.gif', 'JDIH', () {}),
                _buildServiceItem('assets/helpdesk.gif', 'Helpdesk', () {}),
                _buildServiceItem('assets/internal.gif', 'Internal', () {}),
                _buildServiceItem('assets/lainnya.gif', 'Lainnya', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LainnyaPage()),
                  );
                }),
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Layanan Khusus',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200, // Tinggi dari slider horizontal
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3, // Jumlah item dalam slider
                itemBuilder: (context, index) {
                  return GestureDetectorWidget(
                    foto: 'assets/balikpapan3.jpg',
                    route: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImagePathPage(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              bottom: 10,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Berita',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 500,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return berita(
                        image: cards[index]['image']!,
                        category: cards[index]['category']!,
                        title: cards[index]['title']!,
                        subtitle: cards[index]['subtitle']!,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(String imagePath, String label, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
