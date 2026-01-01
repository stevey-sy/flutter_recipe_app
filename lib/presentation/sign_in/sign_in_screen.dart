import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/input_field.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback onTapSignUp;
  final VoidCallback onTapSignIn;
  const SignInScreen({
    super.key,
    required this.onTapSignUp,
    required this.onTapSignIn,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final ScrollController _scrollController =
      ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Hello',
                    style: TextStyles.titleTextBold,
                  ),
                  Text(
                    'Welcome Back!',
                    style: TextStyles.headerTextRegular,
                  ),
                  const SizedBox(height: 57),
                  InputField(
                    label: 'Email',
                    placeholder: 'Enter your email',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 30),
                  InputField(
                    label: 'Password',
                    placeholder: 'Enter your password',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Forgot Password?",
                    style: TextStyles.smallTextRegular
                        .copyWith(
                          color: ColorStyles.secondary100,
                        ),
                  ),
                  const SizedBox(height: 25),
                  BigButton(
                    'Sign In',
                    onPressed: widget.onTapSignIn,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 1,
                        color: ColorStyles.gray4,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Or Sign In With',
                        style: TextStyles.smallTextRegular
                            .copyWith(
                              color: ColorStyles.gray4,
                            ),
                      ),

                      const SizedBox(width: 10),
                      Container(
                        width: 50,
                        height: 1,
                        color: ColorStyles.gray4,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/google.png',
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(width: 15),
                      Image.asset(
                        'assets/image/facebook.png',
                        width: 60,
                        height: 60,
                      ),
                    ],
                  ),
                  const SizedBox(height: 57),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyles.smallerTextBold
                            .copyWith(
                              color: ColorStyles.black,
                            ),
                      ),
                      GestureDetector(
                        onTap: widget.onTapSignUp,
                        child: Text(
                          ' Sign up',
                          style: TextStyles.smallerTextBold
                              .copyWith(
                                color: ColorStyles
                                    .secondary100,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
