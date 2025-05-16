import 'package:flutter/material.dart';

class FeedPost {
  final String id;
  final String userId;
  final String content;
  final List<String> images;
  final DateTime timestamp;
  bool isLiked;
  int likesCount;
  List<Comment> comments;

  FeedPost({
    required this.id,
    required this.userId,
    required this.content,
    required this.images,
    required this.timestamp,
    this.isLiked = false,
    this.likesCount = 0,
    this.comments = const [],
  });
}

class Comment {
  final String id;
  final String userId;
  final String content;
  final DateTime timestamp;

  Comment({
    required this.id,
    required this.userId,
    required this.content,
    required this.timestamp,
  });
}

class FeedProvider with ChangeNotifier {
  List<FeedPost> _posts = [];
  List<FeedPost> get posts => _posts;

  // Dummy data for initial posts
  FeedProvider() {
    _posts = [
      FeedPost(
        id: '1',
        userId: '1',
        content: 'Just finished my morning workout! 💪',
        images: ['assets/images/Launcher icon.png'],
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        likesCount: 15,
      ),
      FeedPost(
        id: '2',
        userId: '2',
        content: 'Beautiful sunrise today! 🌅',
        images: ['assets/images/Launcher icon.png'],
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        likesCount: 25,
      ),
    ];
  }

  void toggleLike(String postId) {
    final postIndex = _posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      _posts[postIndex].isLiked = !_posts[postIndex].isLiked;
      _posts[postIndex].likesCount += _posts[postIndex].isLiked ? 1 : -1;
      notifyListeners();
    }
  }

  void addComment(String postId, String userId, String content) {
    final postIndex = _posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      _posts[postIndex].comments.add(
        Comment(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          userId: userId,
          content: content,
          timestamp: DateTime.now(),
        ),
      );
      notifyListeners();
    }
  }

  void addPost(FeedPost post) {
    _posts.insert(0, post);
    notifyListeners();
  }
} 