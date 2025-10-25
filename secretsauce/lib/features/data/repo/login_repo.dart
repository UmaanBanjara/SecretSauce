import 'package:dio/dio.dart';
import 'package:secretsauce/features/data/models/message_response.dart';

class LoginRepo {
  final String baseUrl;
  final Dio dio;

  LoginRepo({
    required this.baseUrl,
    required this.dio
  });

  Future<MessageResponse> login({
    required String email,
    required String passwd,
  })async{
    try{
      final response = await dio.post(
        '$baseUrl/auth/login',
        options: Options(
          headers :{
            'Content-Type' : 'application/json'
          }
        ),
        data : {
          'email' : email,
          'passwd' : passwd
        }
      );

      if(response.statusCode == 200){
        return MessageResponse.fromJson(response.data);
      }
      else{
        throw Exception('Something went wrong');
      }
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
  
}