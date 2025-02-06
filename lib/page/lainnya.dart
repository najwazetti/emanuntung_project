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
                _buildCategorySection(context, "Informasi Publik", [
                  _buildServiceItem('assets/portalpegawai.gif', 'Portal Pegawai', () {}),
                  _buildServiceItem('assets/aplikasi.gif', 'Aplikasi E-Gov', () {}),
                ]),
                _buildCategorySection(context, "Laporan dan Kedaruratan", [
                  _buildServiceItem('assets/laporankejadian.gif', 'Laporan Kejadian', () {}),
                   _buildServiceItem('assets/nomordarurat.gif', 'Nomor Darurat', () {}),
                ]),
                _buildCategorySection(context, "Kependudukan", [
                  _buildServiceItem('assets/datakependudukan.gif', 'Data Kependudukan', () {}),
                  _buildServiceItem('assets/administrasi.gif', 'Administrasi Kependudukan', () {}),
                ]),
                _buildCategorySection(context, "Manajemen Pemerintahan", [
                  _buildServiceItem('assets/pelayananpajak.gif', 'Pelayanan Pajak', () {}),
                   _buildServiceItem('assets/informasianggaran.gif', 'Informasi Anggaran', () {}),
                ]),
                _buildCategorySection(context, "Kemitraan", [
                  _buildServiceItem('assets/kerjasamabisnis.gif', 'Kerjasama Bisnis', () {}),
                   _buildServiceItem('assets/kerjasamabisnis.gif', 'Program CSR', () {}),
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
                _buildCategoryItem("Informasi Publik", Icons.people),
                _buildCategoryItem("Laporan dan Kedaruratan", Icons.report),
                _buildCategoryItem("Kependudukan", Icons.public),
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
          color: const Color.fromARGB(255, 234, 243, 243),
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
