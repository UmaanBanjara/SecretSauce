import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secretsauce/core/constants/app_strings.dart';
import 'package:secretsauce/core/routes/routes_string.dart';
import 'package:secretsauce/features/auth/presentation/providers/signup_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwdController = TextEditingController();
  bool _isLoading = false;

  @override  
  void dispose(){
    emailController.dispose();
    fnameController.dispose();
    lnameController.dispose();
    usernameController.dispose();
    passwdController.dispose();
    super.dispose();
  }

  Future<void> _onSignup(WidgetRef ref)async{
    setState(() {
      _isLoading = true;
    });
    final formData = {
                        'email' : emailController.text,
                        'fname' : fnameController.text,
                        'lname' : lnameController.text,
                        'username' : usernameController.text,
                        'passwd' : passwdController.text
                      };

    try{
    final result = await ref.read(signupProvider(formData).future);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User Created SuccessFully. Please Check Your Email')));
    context.push(RoutesString.otp);

    }catch(e){
      print('Error : $e');
    }
    finally{
      setState(() {
        _isLoading = false;
      });
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
            child: Center(
              child: Container(
                padding: EdgeInsets.all(12),
                width: screenWidth * 0.5,
                height: screenHeight * 0.85,
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
                      AppStrings.CreateAccount,
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
                    TextField(
                      controller: emailController,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      decoration: InputDecoration(
                        hintText: AppStrings.EnterEmail,
                      ),
                    ),
                    SizedBox(height: 12),
        
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.FirstName,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller : fnameController,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      decoration: InputDecoration(
                        hintText: AppStrings.HintFirstName,
                      ),
                    ),
                    SizedBox(height: 12),
        
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.LastName,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller : lnameController,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      decoration: InputDecoration(
                        hintText: AppStrings.HintLastName,
                      ),
                    ),
                    SizedBox(height: 12),
        
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.UserName,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller : usernameController,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      decoration: InputDecoration(
                        hintText: AppStrings.HintUserName,
                      ),
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
                    TextField(
                      controller : passwdController,
                      obscureText: true,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      decoration: InputDecoration(
                        hintText: AppStrings.HintPassword,
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          text: AppStrings.HaveAccount,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: AppStrings.Login,
                              style: TextStyle(
                                fontFamily: GoogleFonts.cinzel().fontFamily,
                                fontSize: 16,
                                color: theme.primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      // final formData = {
                      //   'email' : emailController.text,
                      //   'fname' : fnameController.text,
                      //   'lname' : lnameController.text,
                      //   'username' : usernameController.text,
                      //   'passwd' : passwdController.text
                      // };

                      // ref.read(signupProvider(formData).future).then((response){
                      //   context.push(RoutesString.otp , extra: {"user_id" : response.userId});
                      // }).catchError((e){
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text(e.toString()))
                      //   );
                      // });

                    onPressed : _isLoading ? null : () => _onSignup(ref),
                    child: 
                    _isLoading ? const CircularProgressIndicator() :
                    Text(AppStrings.Signup)),
                    SizedBox(height: 15),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: AppStrings.ByCreating,
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: AppStrings.TOS,
                            style: TextStyle(
                              fontFamily: GoogleFonts.cinzel().fontFamily,
                              fontSize: 12,
                              color: theme.primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
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
