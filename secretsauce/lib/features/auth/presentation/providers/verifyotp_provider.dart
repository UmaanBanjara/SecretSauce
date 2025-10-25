import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretsauce/features/data/models/message_response.dart';
import 'package:secretsauce/features/data/repo/verifyotp_repo.dart';

final verifyotprepoProvider = Provider<VerifyotpRepo>((ref){
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000'));
  return VerifyotpRepo(baseUrl: dio.options.baseUrl, dio: dio);
});

final verifyotpProvider = FutureProvider.family<MessageResponse, Map<String , dynamic>>((ref , params){
  final repo = ref.watch(verifyotprepoProvider);
  return repo.verifyOTP(otp: params['otp']);
});