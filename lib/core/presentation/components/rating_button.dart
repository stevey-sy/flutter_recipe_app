import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RatingButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const RatingButton(
    this.text, {
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: isSelected
          ? ColorStyles.primary100
          : ColorStyles.white,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyles.smallTextRegular.copyWith(
              color: isSelected
                  ? ColorStyles.white
                  : ColorStyles.primary80,
            ),
          ),
          SizedBox(width: 2),
          Icon(
            size: 18,
            Icons.star,
            color: isSelected
                ? ColorStyles.white
                : ColorStyles.primary80,
          ),
        ],
      ),
      side: const BorderSide(color: ColorStyles.primary100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
