// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';
// @freezed
// abstract class Ingredient with _$Ingredient {
//   const factory Ingredient({
//     required int id,
//     required String name,
//     required String image,
//   }) = _Ingredient;s

//   factory Ingredient.fromJson(Map<String, dynamic> json) =>
//       _$IngredientFromJson(json);
// }

@freezed
@JsonSerializable(explicitToJson: true)
class Ingredient with _$Ingredient {
  final int id;
  final String name;
  final String image;

  const Ingredient({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Ingredient.fromJson(Map<String, Object?> json) =>
      _$IngredientFromJson(json);

  Map<String, Object?> toJson() => _$IngredientToJson(this);
}
