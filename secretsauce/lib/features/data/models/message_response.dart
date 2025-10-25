class MessageResponse {
  final String message;
  final int? userId;
  final String? token;

  MessageResponse({
    required this.message,
    this.userId,
    this.token,
  });

  factory MessageResponse.fromJson(Map<String , dynamic> json){
    return MessageResponse(
      message: json['message'],
      userId: json['user_id'],
      token: json['access_token']
    );
  }
}