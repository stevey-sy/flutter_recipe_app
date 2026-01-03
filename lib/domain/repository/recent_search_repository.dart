import 'package:flutter_recipe_app/domain/model/recipe.dart';

abstract interface class RecentSearchRepository {
  Future<List<Recipe>> getRecentSearches();
  Future<void> updateRecentSearchRecipes(
    List<Recipe> recentRecipes,
  );
}
