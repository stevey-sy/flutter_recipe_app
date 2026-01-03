import 'package:flutter_recipe_app/domain/data_source/local_storage.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final LocalStorage _localStorage;

  const SearchRecipesUseCase({
    required LocalStorage localStorage,
    required RecipeRepository recipeRepository,
  }) : _localStorage = localStorage,
       _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute(String query) async {
    final recipes = await _recipeRepository.getRecipes();
    final result = recipes.where(
      (recipe) => recipe.name.toLowerCase().contains(
        query.toLowerCase(),
      ),
    );
    await _localStorage.save({
      'recipes': result.map((recipe) => recipe.toJson()),
    });
    return result.toList();
  }
}
