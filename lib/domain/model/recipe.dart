// ignore_for_file: annotate_overrides

import 'recipe_ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Recipe with _$Recipe {
  final int id;
  final String category;
  final String name;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final List<RecipeIngredient> ingredients;

  Recipe({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, Object?> json) =>
      _$RecipeFromJson(json);

  Map<String, Object?> toJson() => _$RecipeToJson(this);
}
