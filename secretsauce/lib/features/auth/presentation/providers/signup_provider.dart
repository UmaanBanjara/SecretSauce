import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:secretsauce/features/data/models/message_response.dart';
import 'package:secretsauce/features/data/repo/signup_repo.dart';

final signuprepoProvider = Provider<SignupRepo>((ref){
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8000'));
  return SignupRepo(baseUrl: dio.options.baseUrl, dio: dio);
});

final signupProvider = FutureProvider.family<MessageResponse , Map<String , String>>((ref , FormField){
  final repository = ref.watch(signuprepoProvider);
  return repository.signup(
    email : FormField['email']!,
    fname : FormField['fname']!,
    lname: FormField['lname']!,
    username : FormField['username']!,
    passwd: FormField['passwd']!
  );
});