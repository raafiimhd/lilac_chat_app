class ChatMessage {
  final int id;
  final String message;
  final String timestamp;
  final int senderId;

  ChatMessage({
    required this.id,
    required this.message,
    required this.timestamp,
    required this.senderId,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      message: json['attributes']['message'] ?? '',
      timestamp: json['attributes']['sent_at'] ?? '',
      senderId: json['attributes']['sender_id'],
    );
  }
}
