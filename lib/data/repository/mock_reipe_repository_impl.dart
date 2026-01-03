import 'package:flutter_recipe_app/data/data_source/remote/recipe_data_source.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  MockRecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> getRecipes() async {
    final recipes = await _recipeDataSource.getRecipes();
    return recipes
        .map((recipe) => Recipe.fromJson(recipe))
        .toList();
  }

  @override
  Future<Recipe?> getRecipe(int id) async {
    final recipes = await getRecipes();
    return recipes
        .where((recipe) => recipe.id == id)
        .firstOrNull;
  }
}
