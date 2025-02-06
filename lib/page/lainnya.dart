import 'package:flutter/material.dart';

class LainnyaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Layanan Lainnya"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: "Unggulan"),
              Tab(text: "Kategori"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab Unggulan
            ListView(
              children: [
                _buildCategorySection(context, "Laporan dan Kedaruratan", [
                  _buildServiceItem('assets/city1.jpeg', 'Laporan Warga', () {}),
                  _buildServiceItem('assets/city2.jpeg', 'Kontak Darurat', () {}),
                  _buildServiceItem('assets/city3.jpeg', 'Ambulans', () {}),
                ]),
                _buildCategorySection(context, "Kesehatan", [
                  _buildServiceItem('assets/city4.jpeg', 'Antrean Faskes', () {}),
                ]),
                _buildCategorySection(context, "Sosial dan Ekonomi", [
                  _buildServiceItem('assets/city1.jpeg', 'Pajak', () {}),
                  _buildServiceItem('assets/city2.jpeg', 'Harga Pangan', () {}),
                ]),
                _buildCategorySection(context, "Transportasi", [
                  _buildServiceItem('assets/city3.jpeg', 'Transportasi Publik', () {}),
                ]),
              ],
            ),

            // Tab Kategori
            GridView.count(
              padding: const EdgeInsets.all(16.0),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildCategoryItem("Kesehatan", Icons.health_and_safety),
                _buildCategoryItem("Transportasi", Icons.directions_bus),
                _buildCategoryItem("Kependudukan", Icons.people),
                _buildCategoryItem("Pendidikan", Icons.school),
                _buildCategoryItem("Laporan dan Kedaruratan", Icons.report),
                _buildCategoryItem("Sosial dan Ekonomi", Icons.monetization_on),
                _buildCategoryItem("Informasi Publik", Icons.info),
                _buildCategoryItem("Kemitraan", Icons.handshake),
                _buildCategoryItem("Manajemen Pemerintahan", Icons.account_balance),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk kategori layanan (section)
  Widget _buildCategorySection(
      BuildContext context, String title, List<Widget> items) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8.0),
          Column(children: items),
        ],
      ),
    );
  }

  // Widget untuk item layanan
  Widget _buildServiceItem(String imagePath, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagePath,
                height: 64.0,
                width: 64.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk kategori
  Widget _buildCategoryItem(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Aksi ketika kategori di-tap
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
