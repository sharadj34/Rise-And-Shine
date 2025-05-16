import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _controller = TextEditingController();
  // Mock current user
  final String currentUser = 'SHARAD JHA';
  final String currentUserAvatar = 'assets/images/Ios/avatar 1@3x.png';

  List<Map<String, String>> comments = [
    {
      'user': 'KALPANA',
      'avatar': 'assets/images/Ios/avatar 2@3x.png',
      'text': 'This was the best activity for me. Enjoyed a lot with you guys.',
    },
    {
      'user': 'SHREYA SINGH',
      'avatar': 'assets/images/Ios/avatar 3@3x.png',
      'text': 'Finally I did something for the environment :)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final feed = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: const Color(0xFF8B5CF6),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(feed?['avatar'] ?? ''),
                    radius: 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      (feed?['user'] ?? '').toString().toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.white, size: 28),
                  ),
                ],
              ),
            ),
            // Post Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        feed?['image'] ?? '',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    feed?['caption'] ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.favorite, color: Color(0xFFE91E63), size: 20),
                          const SizedBox(width: 4),
                          Text(
                            (feed?['likes'] ?? 0).toString(),
                            style: const TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            (feed?['comments'] ?? 0).toString(),
                            style: const TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.mode_comment_outlined, color: Color(0xFFE91E63), size: 18),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Comments List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  final isCurrentUser = comment['user'] == currentUser;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(comment['avatar'] ?? ''),
                          radius: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3E8FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      (comment['user'] ?? '').toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    if (isCurrentUser)
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            comments.removeAt(index);
                                          });
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Icon(Icons.delete_outline, color: Color(0xFF8B5CF6), size: 18),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  comment['text'] ?? '',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Add Comment Field
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Write a comment...',
                          border: InputBorder.none,
                        ),
                        minLines: 1,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      final text = _controller.text.trim();
                      if (text.isNotEmpty) {
                        setState(() {
                          comments.add({
                            'user': currentUser,
                            'avatar': currentUserAvatar,
                            'text': text,
                          });
                          _controller.clear();
                        });
                      }
                    },
                    child: const Icon(Icons.send, color: Color(0xFFE91E63), size: 28),
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