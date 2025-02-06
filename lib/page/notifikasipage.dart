import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
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
              'Notifikasi',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
      ),
      body: ListView(
        children: [
          _buildSectionTitle('Hari Ini'),
          _buildNotificationItem(
            'Carlos Sainz',
            'Mohon lengkapi absen anda.',
            '1jam',
            'assets/userprofile.png',
          ),
          _buildNotificationItem(
            'Carlos Sainz',
            'Mohon lengkapi absen anda.',
            '3jam',
            'assets/userprofile.png',
          ),
          _buildSectionTitle('Kemarin'),
          _buildNotificationItem(
            'Carlos Sainz',
            'Mohon lengkapi absen anda.',
            '1hari',
            'assets/userprofile.png',
          ),
          _buildSectionTitle('7 Hari Terakhir'),
          _buildNotificationItem(
            'Carlos Sainz',
            'Mohon lengkapi absen anda.',
            '4hari',
            'assets/userprofile.png',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
      String username, String action, String time, String imageUrl) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
          ),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$username\n',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: action,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          subtitle: Text(
            time,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        const Divider(height: 1, color: Colors.grey),
      ],
    );
  }
}