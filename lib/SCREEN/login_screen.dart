import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/SCREEN/home_screen.dart';
import 'package:newapp/SCREEN/signup_screen.dart';
import 'package:newapp/Widget/text_widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var _form = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  // void loginUser() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   String res = await AuthController().loginUser(
  //     email: emailController.text,
  //     password: passwordController.text,
  //   );
  //   if (res == 'Success') {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     Get.offAll(() => const HomeScreen());
  //   } else {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     SnackBarWidget(
  //       title: 'Error',
  //       message: res,
  //     ).showSnackBar();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _form,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            const Color(0xFF0C84FF).withOpacity(0.8),
            Colors.amberAccent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const TextWidget(
                    text: 'Welcome',
                    fontfamily: 'Roboto',
                    color: Colors.black,
                    fontsize: 41.0,
                    fontstyle: FontStyle.italic,
                    fontweight: FontWeight.w900,
                  ),
                  const TextWidget(
                    text: 'Enter Your Credential To Login',
                    color: Colors.black,
                    fontsize: 20.0,
                    fontstyle: FontStyle.italic,
                    fontweight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        RegExp emailRegex =
                            RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                        if (value!.isEmpty) {
                          return "Enter Email";
                        } else if (!emailRegex.hasMatch(value)) {
                          return "Enter Valid Email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: " Email",
                        labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                          size: 30,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.7), width: 3),
                            borderRadius: BorderRadius.circular(18)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 22),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: " Password",
                        labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600),
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.black,
                          size: 30,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.7), width: 3),
                            borderRadius: BorderRadius.circular(18)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 290,
                      height: 55,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.offAll(() => const HomeScreen());
                            // if (_form.currentState!.validate()) {
                            //   loginUser();
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                )
                              : const TextWidget(
                                  fontfamily: 'Montserrat',
                                  text: 'Login',
                                  fontsize: 25.0,
                                  fontstyle: FontStyle.italic,
                                  fontweight: FontWeight.w700,
                                  color:Colors.white,
                                ))),
                  const SizedBox(
                    height: 25,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const TextWidget(
                        text: 'Forget Password',
                        color: Colors.black,
                        fontsize: 20.0,
                        fontweight: FontWeight.w800,
                        fontstyle: FontStyle.italic,
                      )),
                  const SizedBox(
                    height: 138,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextWidget(
                        text: 'Dont Have An Account ?',
                        color: Color.fromARGB(255, 10, 10, 10),
                        fontsize: 19.0,
                        fontstyle: FontStyle.italic,
                        fontweight: FontWeight.w500,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.offAll(const SignUpScreen());
                          },
                          child: TextWidget(
                            text: 'Sign Up',
                            fontsize: 18.0,
                            fontstyle: FontStyle.italic,
                            fontweight: FontWeight.w700,
                            color: const Color(0xFF0C84FF).withOpacity(0.8),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}