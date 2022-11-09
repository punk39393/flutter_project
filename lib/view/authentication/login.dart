import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/controllers/login_controller.dart';
import 'package:project/view/authentication/register.dart';
import 'package:project/view/home/RiderDashBoard.dart';

import '../../global/global.dart';
import '../../main.dart';
import '../../res/app_colors/AppColors.dart';
import '../home_screen.dart';
import '../widget/custom_text_field.dart';
import '../widget/error_dialog.dart';
import '../widget/header_widget.dart';
import '../widget/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final double _headerHeight = 250;
  final LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  

//form validation for login
  formValidation() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (!emailController.text.isEmail) {
        Get.snackbar("Validation Failure", "Please Enter a valid email address",
            icon: Icon(Icons.email, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else {
        //login
        loginNow();
      }
    } else {
      showDialog(
        context: context,
        builder: (c) {
          return const ErrorDialog(
            message: "Please enter email/password.",
          );
        },
      );
    }
  }

//login function
  loginNow() async {
   
    showDialog(
      context: context,
      builder: (c) {
        return const LoadingDialog(
          message: "Checking Credentials...",
        );
      },
    );
    
    var email = emailController.text.trim();
    var password = passwordController.text.trim();
    loginController.loginUsingEmail(email, password);
    loginController.success.listen((value) {
      if (value == true) {
        Navigator.pop(context);
        sharedPreferences!.setString('email', emailController.text.trim());
        Get.to(RiderDashBoard());
      }
      
    });
    
  }

//read data from firestore and save it locally
//   Future readDataAndSetDataLocally(User currentUser) async {
//
//         if (snapshot.exists) {
//           await sharedPreferences!.setString("uid", currentUser.uid);
//           await sharedPreferences!
//               .setString("email", snapshot.data()!["riderEmail"]);
//           await sharedPreferences!
//               .setString("name", snapshot.data()!["riderName"]);
//           await sharedPreferences!
//               .setString("photoUrl", snapshot.data()!["riderAvatarUrl"]);
//
//         }
//         //if user is not a rider
//         else {
//
//           Navigator.pop(context);
//
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (c) => const LoginScreen(),
//             ),
//           );
//           showDialog(
//             context: context,
//             builder: (c) {
//               return const ErrorDialog(
//                 message: "No record exist.",
//               );
//             },
//           );
//         }
//       },
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white
            // gradient: LinearGradient(
            //   begin: FractionalOffset(-2.0, 0.0),
            //   end: FractionalOffset(5.0, -1.0),
            //   colors: [
            //     AppColors.primaryColor,
            //      AppColors.primaryColor

            //   ],
            // ),
            ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: _headerHeight,
                child: HeaderWidget(
                  _headerHeight,
                  true,
                  Icons.motorcycle,
                ), //let's create a common header widget
              ),
              const SizedBox(height: 50),
              Center(
                child: Text(
                  'Login',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      data: Icons.email,
                      controller: emailController,
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                      isObscene: false,
                    ),
                    CustomTextField(
                      data: Icons.lock,
                      controller: passwordController,
                      hintText: "Password",
                      keyboardType: TextInputType.text,
                      isObscene: true,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                        },
                        child: const Text(
                          "Forgot your password?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 4),
                              blurRadius: 5.0)
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0],
                          colors: [
                            AppColors.primaryColor,
                            AppColors.primaryColor,
                          ],
                        ),
                        color: Colors.deepPurple.shade300,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(50, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text(
                            'Sign In'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          formValidation();
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: AppColors.mainColor,
                              ),
                            ),
                            TextSpan(
                              text: 'Create',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() => RegisterScreen());
                                },
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
