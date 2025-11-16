import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class BigButton extends StatelessWidget {
  const BigButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorStyles.primary100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Big Button', 
            style: TextStyles.normalTextBold.copyWith(color: ColorStyles.white)),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}