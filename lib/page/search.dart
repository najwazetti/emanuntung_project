import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final Map<String, List<Map<String, dynamic>>> categorizedServices = {
    'Informasi Publik': [
      {'image': 'assets/health.jpeg', 'label': 'Ambulans'},
      {'image': 'assets/health.jpeg', 'label': 'Kesehatan Umum'},
    ],
    'Laporan dan Kedaduratan': [
      {'image': 'assets/transport.jpeg', 'label': 'Transportasi Publik'},
      {'image': 'assets/transport.jpeg', 'label': 'Layanan Bus'},
    ],
    'Kependudukan': [
      {'image': 'assets/environment.jpeg', 'label': 'Kualitas Udara'},
      {'image': 'assets/environment.jpeg', 'label': 'Kebersihan Kota'},
    ],
    'Manajemen Pemerintahan': [
      {'image': 'assets/economy.jpeg', 'label': 'Pajak'},
      {'image': 'assets/economy.jpeg', 'label': 'Harga Pangan'},
    ],
    'Kemitraan': [
      {'image': 'assets/economy.jpeg', 'label': 'Pajak'},
      {'image': 'assets/economy.jpeg', 'label': 'Harga Pangan'},
    ],
  };

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    // Filter layanan berdasarkan teks pencarian
    Map<String, List<Map<String, dynamic>>> filteredServices = {};
    if (searchText.isNotEmpty) {
      categorizedServices.forEach((category, services) {
        final filtered = services.where((service) {
          return service['label']
              .toLowerCase()
              .contains(searchText.toLowerCase());
        }).toList();
        if (filtered.isNotEmpty) {
          filteredServices[category] = filtered;
        }
      });
    } else {
      filteredServices = categorizedServices;
    }

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0), // Atur padding kiri dan kanan
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Cari Layanan...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hanya tampilkan teks "Layanan Unggulan" jika hasil pencarian ditemukan
            if (filteredServices.isNotEmpty && searchText.isNotEmpty) ...[
              const Text(
                'Layanan Unggulan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8.0),
            ],
            Expanded(
              child: filteredServices.isNotEmpty
                  ? ListView(
                      children: filteredServices.entries.map((entry) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                entry.key,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            ...entry.value.map((service) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue[50],
                                  child: ClipOval(
                                    child: Image.asset(
                                      service['image'],
                                      fit: BoxFit.cover,
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                ),
                                title: Text(service['label']),
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Anda memilih layanan: ${service['label']}'),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ],
                        );
                      }).toList(),
                    )
                  : const Center(
                      child: Text(
                        'Maaf, pencarian tidak ditemukan.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
