import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/data_source/local/default_local_storage_impl.dart';
import 'package:flutter_recipe_app/data/data_source/remote/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_recent_search_recipe_repository_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_reipe_repository_impl.dart';
import 'package:flutter_recipe_app/domain/data_source/local_storage.dart';
import 'package:flutter_recipe_app/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe_app/presentation/search/screen/search_screen.dart';
import 'package:flutter_recipe_app/presentation/search/search_view_model.dart';

final LocalStorage _localStorage =
    DefaultLocalStorageImpl();

final _recentSearchRepository =
    MockRecentSearchRecipeRepositoryImpl(
      localStorage: _localStorage,
    );

final _searchRecipesUseCase = SearchRecipesUseCase(
  recipeRepository: MockRecipeRepositoryImpl(
    recipeDataSource: RecipeDataSourceImpl(),
  ),
  localStorage: _localStorage,
);

class SearchRoot extends StatelessWidget {
  const SearchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SearchViewModel(
      recentSearchRepository: _recentSearchRepository,
      searchRecipesUseCase: _searchRecipesUseCase,
    );

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        final state = viewModel.state;
        return SearchScreen(
          state: state,
          onChanged: (query) =>
              viewModel.searchRecipes(query),
        );
      },
    );
  }
}
