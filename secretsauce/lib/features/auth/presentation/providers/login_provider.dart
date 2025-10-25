import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:secretsauce/features/data/models/message_response.dart';
import 'package:secretsauce/features/data/repo/login_repo.dart';

final loginrepoProvider = Provider<LoginRepo>((ref){
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000'));
  return LoginRepo(baseUrl: dio.options.baseUrl, dio: dio);
});

final loginProvider = FutureProvider.family<MessageResponse , Map<String , dynamic>>((ref , params){
  final repo = ref.read(loginrepoProvider);
  return repo.login(
    email : params['email'],
    passwd: params['passwd']
  );
});