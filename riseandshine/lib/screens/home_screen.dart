import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _AppDrawer(),
      body: Column(
        children: [
          // Fixed Top Section
          SafeArea(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/Ios/home_top_bg.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                // White strap for navigation
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 60,
                    color: Colors.white.withOpacity(0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          ),
                        ),
                        Image.asset(
                          'assets/images/Ios/home logo.png',
                          height: 50,
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications_none, color: Colors.white),
                          onPressed: () {
                            Navigator.pushNamed(context, '/notifications');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Upcoming Events on the colored bg
                Positioned(
                  left: 0,
                  right: 0,
                  top: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                          'Upcoming Events',
                    style: TextStyle(
                            color: Colors.white,
                      fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _UpcomingEventCard(),
                      ],
                    ),
                    ),
                  ),
                ],
              ),
            ),
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner Carousel
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: FlutterCarousel(
              options: CarouselOptions(
                          height: 140,
                autoPlay: true,
                enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 3),
                          viewportFraction: 0.85,
                        ),
                        items: [
                          'assets/images/Ios/banner 1.png',
                          'assets/images/Ios/banner 2.png',
                          'assets/images/Ios/banner 3.png',
                        ].map((banner) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              banner,
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // Featured Speakers
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                        'Featured Speakers',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
            Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Left: Avatar, Name, Subtitle
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/Ios/speaker avatar@3x.png'),
                                    radius: 24,
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                    'Alisha Shikhar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    'Yoga Expert',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              // Vertical Divider
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                width: 1,
                                height: 90,
                                color: Colors.grey.shade300,
                              ),
                              // Right: Session Info
                              Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                                      'Session: Way to a Calm Mind',
                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: const [
                                        Icon(Icons.calendar_today, color: Color(0xFF8B5CF6), size: 22),
                                        SizedBox(width: 8),
                                        Flexible(
                                          child: Text(
                                            '5 Jan | 12.30 PM - 1.30 PM',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF8B5CF6),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // What's Happening Around you!
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "What's Happening Around you!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Feed tiles one below another
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: List.generate(4, (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/feed');
                            },
                            child: _buildFeedTile(index),
                          ),
                        )),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(String image, String title, String subtitle) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.asset(
            image,
            width: 200,
            height: 120,
            fit: BoxFit.cover,
          ),
          Container(
            width: 200,
            height: 120,
        decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 24,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 8,
            child: Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedTile(int index) {
    // Placeholder data for feed tiles
    final images = [
      'assets/images/Ios/posted image 1.png',
      'assets/images/Ios/posted image 2.png',
      'assets/images/Ios/posted image 1.png',
      'assets/images/Ios/posted image 2.png',
    ];
    final users = [
      'Ankit Rastogi',
      'Priya Sharma',
      'Sharad Jha',
      'Sneha Patel',
    ];
    final times = [
      '30 minutes ago',
      '1 hour ago',
      '2 hours ago',
      'yesterday',
    ];
    final descs = [
      'Plantation Activity made fun!',
      'Yoga session highlights',
      'Evening games',
      'Morning meditation',
    ];
    final avatars = [
      'assets/images/Ios/avatar 1@3x.png',
      'assets/images/Ios/avatar 2@3x.png',
      'assets/images/Ios/avatar 1@3x.png',
      'assets/images/Ios/avatar 3@3x.png',
    ];
    final likes = [105, 88, 67, 54];
    final comments = [10, 5, 8, 2];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 4,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Avatar, Name, Time
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(avatars[index]),
                  radius: 24,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      users[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'posted ${times[index]}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFFFF9800),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Post Image
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  images[index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Like/Comment Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border, color: Color(0xFFE91E63), size: 26),
                    const SizedBox(width: 6),
                    Text(
                      likes[index].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      comments[index].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(Icons.mode_comment_outlined, color: Color(0xFFE91E63), size: 24),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Caption
            Text(
              descs[index],
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Upcoming Event Card Widget
class _UpcomingEventCard extends StatelessWidget {
  const _UpcomingEventCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: const Text('Session: Ice Breaker Games Activity', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: const [
            Icon(Icons.calendar_today, size: 16, color: Colors.purple),
            SizedBox(width: 4),
            Text('5 Jan | 1:00 PM - 1:30 PM', style: TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      backgroundColor: Color(0xFFF3E8FF), // Light purple
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 24),
                // Cross button (top right)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, size: 28, color: Colors.black87),
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName('/home'));
                    },
                  ),
                ),
                const SizedBox(height: 8),
                // Centered logo
                Center(
                  child: Image.asset(
                    'assets/images/Ios/login_logo@3x.png',
                    height: 100,
                  ),
                ),
                const SizedBox(height: 32),
                // Home option
                ListTile(
                  leading: const Icon(Icons.home, color: Color(0xFFE91E63)),
                  title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  onTap: () {
                    Navigator.popUntil(context, ModalRoute.withName('/home'));
                  },
                ),
                // Feed option
                ListTile(
                  leading: const Icon(Icons.feed, color: Color(0xFFE91E63)),
                  title: const Text('Feed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/feed');
                  },
                ),
                const Spacer(),
                // Logout button at the bottom center
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        elevation: 4,
                      ),
                      icon: const Icon(Icons.logout),
                      label: const Text('Logout', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () async {
                        await Provider.of<AuthProvider>(context, listen: false).logout();
                        Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 