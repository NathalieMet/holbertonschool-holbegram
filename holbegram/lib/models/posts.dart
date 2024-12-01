class Post {
  final String caption;
  final String uid;
  final String username;
  final List likes;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;

  Post({
    required this.caption,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });

  // Factory method to create a Post instance from a JSON map
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      caption: json['caption'] as String,
      uid: json['uid'] as String,
      username: json['username'] as String,
      likes: List.from(json['likes']),
      postId: json['postId'] as String,
      datePublished: DateTime.parse(json['datePublished']),
      postUrl: json['postUrl'] as String,
      profImage: json['profImage'] as String,
    );
  }

  // Method to convert a Post instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'caption': caption,
      'uid': uid,
      'username': username,
      'likes': likes,
      'postId': postId,
      'datePublished': datePublished.toIso8601String(),
      'postUrl': postUrl,
      'profImage': profImage,
    };
  }
}
