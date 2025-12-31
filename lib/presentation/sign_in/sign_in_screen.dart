import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/input_field.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                style: TextStyles.smallTextRegular.copyWith(
                  color: ColorStyles.secondary100,
                ),
              ),
              const SizedBox(height: 25),
              BigButton('Sign In', onPressed: () {}),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        .copyWith(color: ColorStyles.gray4),
                  ),

                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 1,
                    color: ColorStyles.gray4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
