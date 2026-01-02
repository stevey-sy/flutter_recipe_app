import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  SavedRecipesState _state = SavedRecipesState();
  // gtter
  SavedRecipesState get state => _state;

  // 상태
  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase {
    _loadRecipeData();
  }

  void _loadRecipeData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _getSavedRecipesUseCase.execute(),
      isLoading: false,
    );
    notifyListeners();
  }
}
