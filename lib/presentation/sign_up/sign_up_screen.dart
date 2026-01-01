import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/input_field.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;
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
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Create an account',
                    style: TextStyles.largeTextBold,
                  ),
                  SizedBox(
                    width: 195,
                    child: Text(
                      'Let’s help you set up your account, it won’t take long.',
                      style: TextStyles.smallerTextRegular,
                    ),
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: 'Name',
                    placeholder: 'Enter your name',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 30),
                  InputField(
                    label: 'Email',
                    placeholder: 'Enter your email',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: 'Password',
                    placeholder: 'Enter your password',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: 'Confirm Password',
                    placeholder: 'Retype your password',
                    controller: TextEditingController(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5),
                        ),
                        side: BorderSide(
                          color: ColorStyles.secondary100,
                          width: 1.5,
                        ),
                        activeColor:
                            ColorStyles.secondary100,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        'Accept terms & conditions',
                        style: TextStyles.smallTextRegular
                            .copyWith(
                              color:
                                  ColorStyles.secondary100,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  BigButton('Sign Up', onPressed: () {}),
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(
                        'Alredy a member?',
                        style: TextStyles.smallerTextBold
                            .copyWith(
                              color: ColorStyles.black,
                            ),
                      ),
                      Text(
                        ' Sign In',
                        style: TextStyles.smallerTextBold
                            .copyWith(
                              color:
                                  ColorStyles.secondary100,
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
