import 'package:dio/dio.dart';
import 'package:secretsauce/features/data/models/message_response.dart';

class VerifyotpRepo {
  final String baseUrl;
  final Dio dio;

  VerifyotpRepo({
    required this.baseUrl,
    required this.dio
  });

  Future<MessageResponse> verifyOTP({
    required String otp
  })async{
    try{
      final response = await dio.post(
        '$baseUrl/auth/otpcheck',
        options: Options(
          headers: {
            'Content-Type' : 'application/json'
          }
        ),
        data : {
          'otp' : otp
        }
      );
      if(response.statusCode == 200)
{
  
  
    return MessageResponse.fromJson(response.data);
}

else{
  throw Exception(response.data['detail'] ?? "Something went wrong");
}

    }
    catch(e){
      throw Exception(e.toString());
    }
  }
}