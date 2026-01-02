// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
  id: (json['id'] as num).toInt(),
  category: json['category'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  chef: json['chef'] as String,
  time: json['time'] as String,
  rating: (json['rating'] as num).toDouble(),
  ingredients: (json['ingredients'] as List<dynamic>)
      .map((e) => RecipeIngredient.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'name': instance.name,
  'image': instance.image,
  'chef': instance.chef,
  'time': instance.time,
  'rating': instance.rating,
  'ingredients': instance.ingredients,
};
