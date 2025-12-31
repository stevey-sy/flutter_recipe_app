import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 315 / 150,
            child: Container(
              decoration: BoxDecoration(
                color: ColorStyles.gray4,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(recipe.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    recipe.name,
                    style: TextStyles.smallTextBold
                        .copyWith(color: ColorStyles.white),
                  ),
                ),
                Text(
                  'By ${recipe.chef}',
                  style: TextStyles.smallerTextRegular
                      .copyWith(color: ColorStyles.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Row(
              children: [
                Icon(
                  Icons.alarm,
                  color: ColorStyles.white,
                  size: 17,
                ),
                SizedBox(width: 5),
                Text(
                  recipe.time,
                  style: TextStyles.smallerTextRegular
                      .copyWith(color: ColorStyles.white),
                ),
                SizedBox(width: 10),
                ClipOval(
                  child: Container(
                    color: ColorStyles.white,
                    padding: EdgeInsets.all(3),
                    child: Icon(
                      Icons.bookmark_border_outlined,
                      color: ColorStyles.primary80,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 37,
              height: 16,
              decoration: BoxDecoration(
                color: ColorStyles.secondary20,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: ColorStyles.rating,
                    size: 12,
                  ),
                  Text(
                    recipe.rating.toString(),
                    style: TextStyles.smallerTextRegular
                        .copyWith(
                          color: ColorStyles.rating,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
