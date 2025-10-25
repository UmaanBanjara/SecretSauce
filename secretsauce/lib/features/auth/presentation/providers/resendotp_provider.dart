import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretsauce/features/data/models/message_response.dart';
import 'package:secretsauce/features/data/repo/resendotp_repo.dart';

final resendotprepoProvider = Provider<ResendotpRepo>((ref){
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000'));
  return ResendotpRepo(baseUrl: dio.options.baseUrl, dio: dio);
});

final resendProvider = FutureProvider.family<MessageResponse , Map<String , dynamic>>((ref , params){
  final repo = ref.read(resendotprepoProvider);
  return repo.resendOTP(
    fname : params['fname'],
    email : params['email'],
    userId: params['userId'],
  );
});