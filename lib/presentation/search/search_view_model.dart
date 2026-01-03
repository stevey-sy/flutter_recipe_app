import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/repository/recent_search_repository.dart';
import 'package:flutter_recipe_app/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecentSearchRepository _recentSearchRepository;

  // constructor
  SearchViewModel({
    required RecentSearchRepository recentSearchRepository,
  }) : _recentSearchRepository = recentSearchRepository {
    _loadRecentSearchRecipes();
  }

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
}
