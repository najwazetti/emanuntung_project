import 'dart:async';
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
  static const Duration autoScrollDuration = Duration(seconds: 3);
  static const Duration pageAnimationDuration = Duration(milliseconds: 300);
  
  final List<String> carouselImages = [
    'assets/balikpapan1.jpg',
    'assets/balikpapan2.jpg',
  ];

  final List<ServiceItem> serviceItems = [
    ServiceItem(
      imagePath: 'assets/kependudukan.gif',
      label: 'Statistika Kependudukan',
      route: LoginPage(),
    ),
    ServiceItem(imagePath: 'assets/kelurahan.gif', label: 'Kelurahan'),
    ServiceItem(imagePath: 'assets/tenagakerja.gif', label: 'Tenaga Kerja'),
    ServiceItem(imagePath: 'assets/pajak.gif', label: 'Pajak Daerah Balikpapan'),
    ServiceItem(imagePath: 'assets/jdih.gif', label: 'JDIH'),
    ServiceItem(imagePath: 'assets/helpdesk.gif', label: 'Helpdesk'),
    ServiceItem(imagePath: 'assets/internal.gif', label: 'Internal'),
    ServiceItem(
      imagePath: 'assets/lainnya.gif',
      label: 'Lainnya',
      route: LainnyaPage(),
    ),
  ];

  final List<NewsItem> newsItems = [
    NewsItem(
      image: 'assets/berita1.png',
      title: 'Balikpapan Kembangkan 11 Sekolah Rujukan Google, Siapkan Generasi Digital',
      date: '18 Januari 2025',
      category: 'News',
    ),
    NewsItem(
      image: 'assets/berita2.png',
      title: 'Pengembangan Griya Rudiana Asri Laporkan 8 Orang ke Polda Kaltim',
      date: '18 Januari 2025',
      category: 'News',
    ),
    NewsItem(
      image: 'assets/berita3.png',
      title: 'Wali Kota Balikapapan Dukung Proyek Tol Bandara SAMS Sepinggan-IKN',
      date: '18 Januari 2025',
      category: 'News',
    ),
    NewsItem(
      image: 'assets/berita4.png',
      title: '2 Tahun Jadi DPO Korupsi, Mantan Kades di Mojokerto Jadi Sopir di Balikpapan, Rugikan Negara Rp 120 Juta',
      date: '18 Januari 2025',
      category: 'News',
    ),
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
    _timer = Timer.periodic(autoScrollDuration, (timer) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % carouselImages.length;
        _pageController.animateToPage(
          _currentPage,
          duration: pageAnimationDuration,
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
          _buildCarouselHeader(context),
          _buildServiceGrid(),
          _buildSpecialServicesSection(),
          _buildNewsSection(),
        ],
      ),
    );
  }

  Widget _buildCarouselHeader(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.2,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            _buildImageCarousel(),
            _buildSearchBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return PageView.builder(
      controller: _pageController,
      itemCount: carouselImages.length,
      onPageChanged: (index) => setState(() => _currentPage = index),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ImagePathPage()),
          ),
          child: Image.asset(
            carouselImages[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Positioned(
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[600], size: 24),
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
    );
  }

  Widget _buildServiceGrid() {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 2,
          childAspectRatio: 0.8, // Adjusted for better text fitting
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildServiceItem(serviceItems[index]),
          childCount: serviceItems.length,
        ),
      ),
    );
  }

  Widget _buildServiceItem(ServiceItem item) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.route != null
            ? () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.route!),
                )
            : null,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              radius: 30,
              backgroundImage: AssetImage(item.imagePath),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  item.label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialServicesSection() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Layanan Khusus',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return GestureDetectorWidget(
                  foto: 'assets/balikpapan3.jpg',
                  route: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImagePathPage()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsSection() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 10),
            child: Text(
              'Berita',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: newsItems.map((item) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Berita(
                image: item.image,
                category: item.category,
                title: item.title,
                subtitle: item.date,
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}

class ServiceItem {
  final String imagePath;
  final String label;
  final Widget? route;

  ServiceItem({
    required this.imagePath,
    required this.label,
    this.route,
  });
}

class NewsItem {
  final String image;
  final String title;
  final String date;
  final String category;

  NewsItem({
    required this.image,
    required this.title,
    required this.date,
    required this.category,
  });
}

class Berita extends StatelessWidget {
  final String image;
  final String category;
  final String title;
  final String subtitle;

  const Berita({
    Key? key,
    required this.image,
    required this.category,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}