import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/repository/mock_bookmark_repository.dart';
import 'package:flutter_recipe_app/data/repository/mock_reipe_repository_impl.dart';
import 'package:flutter_recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_recipe_app/presentation/saved_recipes/screen/saved_recipes_screen.dart';

final _getSavedRecipesUseCase = GetSavedRecipesUseCase(
  recipeRepository: MockRecipeRepositoryImpl(),
  bookmarkRepository: MockBookmarkRepositoryImpl(),
);

class SavedRecipesRoot extends StatelessWidget {
  const SavedRecipesRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SavedRecipesViewModel(
      getSavedRecipesUseCase: _getSavedRecipesUseCase,
    );

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        final state = viewModel.state;
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return SavedRecipesScreen(recipes: state.recipes);
      },
    );
  }
}
