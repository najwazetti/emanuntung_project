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
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.history),
              ),
              title: Text('Aktivitas ${index + 1}'),
              subtitle: Text('Detail aktivitas ${index + 1}'),
  
             trailing: Text(
                  // ignore: unnecessary_string_interpolations
                  '${DateTime.now().subtract(Duration(days: index)).toString().split(' ')[0]}'),
            ),
          );
        },
      ),
    );
  }
}