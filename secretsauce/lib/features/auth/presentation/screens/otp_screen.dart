import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secretsauce/core/constants/app_strings.dart';
import 'package:secretsauce/core/routes/routes_string.dart';
import 'package:secretsauce/core/widgets/custom_snackbar.dart';
import 'package:secretsauce/features/auth/presentation/providers/resendotp_provider.dart';
import 'package:secretsauce/features/auth/presentation/providers/verifyotp_provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpcontroller = TextEditingController();
  bool _isloading = false;
  late final String email;
  late final String fname;
  late final int userId;
  bool _isInit = false;
  void didChangeDependencies(){
    super.didChangeDependencies();
    if(!_isInit){

    
    final data = GoRouterState.of(context).extra as Map<String , dynamic>?;
    if(data != null){

    
    email = data['email'] as String;
    fname = data['fname'] as String;
    userId = data['userId'] as int;

    }
    else{
      throw Exception('No extra data provided to OTPscreen');
    }}
    _isInit = true;
  }

  void dispose(){
    _otpcontroller.dispose();
    super.dispose();
  }
  Future<void> verifyOTP(WidgetRef ref)async{
    setState(() {
      _isloading = true;
    });

    final params = {
      'otp' : _otpcontroller.text
    };

    try{
      
      // ignore: unused_local_variable
      final result = await ref.read(verifyotpProvider(params).future);
      showCustomSnackbar(context, "OTP verified successfully. Please Log-In" , isError: false);
      context.push(RoutesString.login);

    }
    catch(e){
      showCustomSnackbar(context, "Something went wrong" , isError: true);
    }
    finally{
      setState(() {
        _isloading = false;
      });
    }
  }

  Future<void> resendOTP(WidgetRef ref)async{
    setState(() {
      _isloading = true;
    });
    
    print('Email is : ${email}');
    print('userId is : ${userId}');
    print('First Name is : ${fname}');


    final params = {
      'email' : email,
      'userId' : userId,
      'fname' : fname
    };


    try{
      // ignore: unused_local_variable
      final response = await ref.read(resendProvider(params).future);
      showCustomSnackbar(context, "OTP resent successfully. Please check you email" , isError: false);
    }
    catch(e){
      print(e);
      showCustomSnackbar(context, "Something went wrong" , isError: true);
    }
    finally{
      setState(() {
        _isloading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Consumer(
      builder: (context, ref , child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                width: screenWidth * 0.5,
                height: screenHeight * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: 4,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.OtpVerification,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 12),
        
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.EnterOtp,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller : _otpcontroller,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      decoration: InputDecoration(
                        hintText: AppStrings.OtpHint,
                        counterText: "",
                      ),
                    ),
                    const SizedBox(height: 20),
        
                    ElevatedButton(
                      onPressed : _isloading ? null : () => verifyOTP(ref),
                      child: 
                      _isloading ? CircularProgressIndicator(color: const Color(0xFFAACF9C),) :
                      Text(AppStrings.VerifyOtp),
                    ),
        
                    const SizedBox(height: 15),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: AppStrings.DidNotReceiveOtp,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: AppStrings.Resend,
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 12,
                              color: theme.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                resendOTP(ref);
                                print("Resend OTP tapped");
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
