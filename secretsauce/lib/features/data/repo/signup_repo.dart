import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:secretsauce/features/data/models/message_response.dart';

class SignupRepo {
  final String baseUrl;
  final Dio dio;
  SignupRepo({
    required this.baseUrl,
    required this.dio
  });

  Future<MessageResponse> signup({
    required String email,
    required String fname,
    required String lname,
    required String username,
    required String passwd,
  }) async{
    final response = await dio.post(
      '$baseUrl/auth/signup',

      options : Options(
        headers: {
          'Content-Type' : 'application/json'
        }
      ),
      data: jsonEncode({
        'email' : email,
        'fname' : fname,
        'lname' : lname,
        'username' : username,
        'passwd' : passwd
      })
      
    );
    if(response.statusCode == 200){
      return MessageResponse.fromJson(jsonDecode(response.data));
    }
    else{
      throw Exception(jsonDecode(response.data)['detail'] ?? "Something went wrong");
    }
  }
  
}