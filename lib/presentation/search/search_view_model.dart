import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/repository/recent_search_repository.dart';
import 'package:flutter_recipe_app/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe_app/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecentSearchRepository _recentSearchRepository;
  final SearchRecipesUseCase _searchRecipesUseCase;
  // named argument constructor
  SearchViewModel({
    required RecentSearchRepository recentSearchRepository,
    required SearchRecipesUseCase searchRecipesUseCase,
  }) : _recentSearchRepository = recentSearchRepository,
       _searchRecipesUseCase = searchRecipesUseCase;

  SearchState _state = SearchState();
  // getter
  SearchState get state => _state;

  void _loadRecentSearchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _recentSearchRepository
          .getRecentSearches(),
      isLoading: false,
    );
    notifyListeners();
  }

  void searchRecipes(String query) async {
    print('searchRecipes: $query');
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _searchRecipesUseCase.execute(query),
      isLoading: false,
    );
    notifyListeners();
  }
}
