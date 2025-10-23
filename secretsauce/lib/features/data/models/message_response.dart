class MessageResponse {
  final String message;
  final int? userId;

  MessageResponse({
    required this.message,
    this.userId
  });

  factory MessageResponse.fromJson(Map<String , dynamic> json){
    return MessageResponse(
      message: json['message'],
      userId: json['user_id']
    );
  }
}