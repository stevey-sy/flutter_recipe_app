import 'package:flutter_recipe_app/domain/data_source/local_storage.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recent_search_repository.dart';

class MockRecentSearchRecipeRepositoryImpl
    implements RecentSearchRepository {
  final LocalStorage _localStorage;

  const MockRecentSearchRecipeRepositoryImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @override
  Future<List<Recipe>> getRecentSearches() async {
    try {
      final json = await _localStorage.load();
      return json['recipes']
              ?.map<Recipe>(
                (recipe) => Recipe.fromJson(recipe),
              )
              .toList() ??
          [];
    } on Exception catch (e) {
      return [];
    }
  }

  @override
  Future<void> updateRecentSearchRecipes(
    List<Recipe> recentRecipes,
  ) async {
    await _localStorage.save({
      'recipes': recentRecipes.map(
        (recipe) => recipe.toJson(),
      ),
    });
  }
}
