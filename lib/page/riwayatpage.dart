import 'package:flutter/material.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Text(
              'Riwayat',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(width: 8),
            Icon(Icons.keyboard_arrow_down, color: Color.fromARGB(255, 0, 0, 0), size: 30),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.blue, size: 30),
            onPressed: () {
              // Aksi untuk filter
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.history, color: Colors.blue, size: 30),
              ),
              title: Text(
                'Aktivitas ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(
                'Detail aktivitas ${index + 1}',
                style: TextStyle(color: Colors.grey[600]),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateTime.now().subtract(Duration(days: index)).toString().split(' ')[0],
                    style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 16),
                ],
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              onTap: () {
                // Aksi ketika item di-tap
              },
            ),
          );
        },
      ),
    );
  }
}