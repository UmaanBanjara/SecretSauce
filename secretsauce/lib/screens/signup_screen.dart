import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secretsauce/constants/app_strings.dart';
import 'package:secretsauce/routes/routes_string.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

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
                              context.push(RoutesString.login);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {
                  context.push(RoutesString.otp);
                }, child: Text(AppStrings.Signup)),
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
    );
  }
}
