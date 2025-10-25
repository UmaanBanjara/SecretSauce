import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secretsauce/core/constants/app_strings.dart';
import 'package:secretsauce/core/routes/routes_string.dart';
import 'package:secretsauce/core/validators/validators.dart';
import 'package:secretsauce/core/widgets/custom_snackbar.dart';
import 'package:secretsauce/features/auth/presentation/providers/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
      final _formkey = GlobalKey<FormState>();
      final _emailcontroller = TextEditingController();
      final _passwdcontroller = TextEditingController();
      bool _isloading = false;

  @override 
  void dispose(){
    _emailcontroller.dispose();
    _passwdcontroller.dispose();
    super.dispose();
  }

  Future<void> login(WidgetRef ref)async{
    setState(() {
      _isloading = true;
    });

    final params = {
      'email' : _emailcontroller.text,
      'passwd' : _passwdcontroller.text,
    };

    try{
      // ignore: unused_local_variable
      final result = await ref.read(loginProvider(params).future);
      showCustomSnackbar(context, "Login Successfull" , isError: false);
      context.go(RoutesString.home);
    }
    catch(e){
      showCustomSnackbar(context, e.toString() , isError: true);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);


    return Consumer(
      builder: (context , ref , child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(24),
            child: Form(
              key : _formkey,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(12),
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
                        AppStrings.Login,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 12),
                      
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.Email,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller : _emailcontroller,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                        decoration: InputDecoration(
                          hintText: AppStrings.EnterEmail,
                        ),
                        validator : Validators.validateGmail
                      ),
                      SizedBox(height: 12),
                      
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.Password,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller : _passwdcontroller,
                        obscureText: true,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                        decoration: InputDecoration(
                          hintText: AppStrings.HintPassword,
                        ),
                        validator : Validators.validatePassword
                      ),
                      SizedBox(height: 20),
                      
                      ElevatedButton(
                        onPressed : _isloading ? null : () => login(ref),
                        child: 
                        _isloading ? CircularProgressIndicator(color : const Color(0xFFAACF9C)) :
                        Text(AppStrings.Login),
                      ),
                      
                      SizedBox(height: 15),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: AppStrings.ByLogging,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: AppStrings.TOS,
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 12,
                                color: theme.primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.push(RoutesString.tos);
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
          ),
        );
      }
    );
  }
}
