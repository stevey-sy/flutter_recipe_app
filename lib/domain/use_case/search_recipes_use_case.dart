import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const SearchRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute(String query) async {
    final recipes = await _recipeRepository.getRecipes();
    return recipes
        .where(
          (recipe) => recipe.name.toLowerCase().contains(
            query.toLowerCase(),
          ),
        )
        .toList();
  }
}
