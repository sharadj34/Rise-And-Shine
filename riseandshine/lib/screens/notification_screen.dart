import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock notifications (use your feed data structure)
    final notifications = [
      {
        'user': 'Ankit Rastogi',
        'avatar': 'assets/images/Ios/avatar 1@3x.png',
        'caption': 'Plantation Activity made fun!',
        'image': 'assets/images/Ios/posted image 1.png',
        'time': '30 minutes ago',
      },
      {
        'user': 'Kalpana',
        'avatar': 'assets/images/Ios/avatar 2@3x.png',
        'caption': 'Fitness check, which team will win?',
        'image': 'assets/images/Ios/posted image 2.png',
        'time': '5 hours ago',
      },
      {
        'user': 'Sharad Jha',
        'avatar': 'assets/images/Ios/avatar 1@3x.png',
        'caption': 'Morning meditation',
        'image': 'assets/images/Ios/posted image 1.png',
        'time': 'yesterday',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 48), // for symmetry
              ],
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(notif['avatar']!),
              radius: 22,
            ),
            title: Text(
              notif['user']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notif['caption']!,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  notif['time']!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            trailing: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                notif['image']!,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          );
        },
      ),
    );
  }
} 