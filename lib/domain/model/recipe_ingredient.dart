// ignore_for_file: annotate_overrides

import 'package:flutter_recipe_app/domain/model/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_ingredient.freezed.dart';
part 'recipe_ingredient.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class RecipeIngredient with _$RecipeIngredient {
  final Ingredient ingredient;
  final int amount;

  RecipeIngredient({
    required this.ingredient,
    required this.amount,
  });

  factory RecipeIngredient.fromJson(
    Map<String, Object?> json,
  ) => _$RecipeIngredientFromJson(json);

  Map<String, Object?> toJson() =>
      _$RecipeIngredientToJson(this);
}
