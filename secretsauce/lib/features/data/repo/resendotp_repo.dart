import 'package:dio/dio.dart';
import 'package:secretsauce/features/data/models/message_response.dart';

class ResendotpRepo {
  final String baseUrl;
  final Dio dio;

  ResendotpRepo({
    required this.baseUrl,
    required this.dio
  });

  Future<MessageResponse> resendOTP({
    required String fname,
    required String email,
    required int userId,
  })async{
    try{
      final response = await dio.post(
        '$baseUrl/auth/resend',
        options: Options(
          headers : {
            'Content-Type' : 'application/json',
          }
        ),
        data : {
          'email' : email,
          'userId' : userId,
          'fname' : fname
        }

      );
      if(response.statusCode == 200){
        return MessageResponse.fromJson(response.data);
      }
      else{
        throw Exception(response.data['detail'] ?? "Something went wrong");
      }
    }
    catch(e){
      print('Something went wrong : $e');
      throw Exception(e.toString());

    }
  }
}