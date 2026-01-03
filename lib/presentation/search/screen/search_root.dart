import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/data_source/local/local_recent_search_recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/repository/mock_recent_search_recipe_repository_impl.dart';
import 'package:flutter_recipe_app/presentation/search/screen/search_screen.dart';
import 'package:flutter_recipe_app/presentation/search/search_view_model.dart';

final _recentSearchRepository =
    MockRecentSearchRecipeRepositoryImpl(
      recipeDataSource:
          LocalRecentSearchRecipeDataSourceImpl(),
    );

class SearchRoot extends StatelessWidget {
  const SearchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SearchViewModel(
      recentSearchRepository: _recentSearchRepository,
    );

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        final state = viewModel.state;
        return SearchScreen(state: state);
      },
    );
  }
}
