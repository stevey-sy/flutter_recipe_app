import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/medium_button.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  final VoidCallback onStartCooking;

  const SplashScreen({
    super.key,
    required this.onStartCooking,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/image/splash_background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            child: Column(
              children: [
                SizedBox(height: 100),
                Image.asset(
                  'assets/image/chef_hat.png',
                  width: 79,
                  height: 79,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 14),
                Text(
                  '100K+ Premium Recipes',
                  style: TextStyles.mediumTextBold.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 213,
                  child: Text(
                    'Get Cooking',

                    style: TextStyles.headerTextBold
                        .copyWith(
                          color: ColorStyles.white,
                          fontSize: 48,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Simple way to Tasty Recipe',
                  style: TextStyles.normalTextRegular
                      .copyWith(color: ColorStyles.white),
                ),
                const SizedBox(height: 64),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 66,
                  ),
                  child: MediumButton(
                    'Start Cooking',
                    onPressed: onStartCooking,
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
