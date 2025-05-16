import 'package:flutter/material.dart';
import 'feed_post_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  // Mock feed data
  List<Map<String, dynamic>> feeds = [
    {
      'user': 'Ankit Rastogi',
      'avatar': 'assets/images/Ios/avatar 1@3x.png',
      'time': '30 minutes ago',
      'image': 'assets/images/Ios/posted image 1.png',
      'caption': 'Plantation Activity made fun!',
      'likes': 105,
      'comments': 10,
      'liked': false,
    },
    {
      'user': 'Kalpana',
      'avatar': 'assets/images/Ios/avatar 2@3x.png',
      'time': '5 hours ago',
      'image': 'assets/images/Ios/posted image 2.png',
      'caption': 'Fitness check, which team will win?',
      'likes': 224,
      'comments': 18,
      'liked': true,
    },
    {
      'user': 'Ankit Rastogi',
      'avatar': 'assets/images/Ios/avatar 1@3x.png',
      'time': '30 minutes ago',
      'image': 'assets/images/Ios/posted image 1.png',
      'caption': 'Plantation Activity made fun!',
      'likes': 105,
      'comments': 10,
      'liked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/Ios/top bg.png',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/Ios/home logo.png',
                        height: 48,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeedPostScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: feeds.length,
        itemBuilder: (context, index) {
          final feed = feeds[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              elevation: 4,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row: Avatar, Name, Time, Delete
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(feed['avatar']),
                          radius: 22,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                feed['user'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'posted ${feed['time']}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFFFF9800),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.black54),
                          onPressed: () {
                            setState(() {
                              feeds.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    // Post Image
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          feed['image'],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Like/Comment Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              feed['liked'] = !feed['liked'];
                              feed['likes'] += feed['liked'] ? 1 : -1;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                feed['liked'] ? Icons.favorite : Icons.favorite_border,
                                color: Color(0xFFE91E63),
                                size: 24,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                feed['likes'].toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              feed['comments'].toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/comments',
                                  arguments: feed,
                                );
                              },
                              child: Icon(Icons.mode_comment_outlined, color: Color(0xFFE91E63), size: 22),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Caption
                    Text(
                      feed['caption'],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
} 