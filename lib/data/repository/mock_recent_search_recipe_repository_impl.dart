import 'package:flutter_recipe_app/data/data_source/remote/recipe_data_source.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recent_search_repository.dart';

class MockRecentSearchRecipeRepositoryImpl
    implements RecentSearchRepository {
  final RecipeDataSource _recipeDataSource;

  const MockRecentSearchRecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> getRecentSearches() async {
    final recipes = await _recipeDataSource.getRecipes();
    return recipes
        .map<Recipe>((recipe) => Recipe.fromJson(recipe))
        .toList();
  }

  @override
  Future<void> updateRecentSearchRecipes(
    List<Recipe> recentRecipes,
  ) {
    // TODO: implement updateRecentSearchRecipes
    throw UnimplementedError();
  }
}
