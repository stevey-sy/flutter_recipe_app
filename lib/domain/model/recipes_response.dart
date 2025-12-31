import 'recipe.dart';

class RecipesResponse {
  final List<Recipe> recipes;

  RecipesResponse({required this.recipes});

  factory RecipesResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return RecipesResponse(
      recipes: (json['recipes'] as List<dynamic>)
          .map(
            (item) => Recipe.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipes': recipes
          .map((item) => item.toJson())
          .toList(),
    };
  }

  @override
  String toString() {
    return 'RecipesResponse(recipes: ${recipes.length})';
  }
}
