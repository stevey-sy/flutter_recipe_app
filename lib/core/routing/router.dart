import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/repository/mock_bookmark_repository.dart';
import 'package:flutter_recipe_app/data/repository/mock_reipe_repository_impl.dart';
import 'package:flutter_recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart'
    show GoRouter, GoRoute, GoRouterHelper;

final router = GoRouter(
  // initialLocation: '/Splash',
  initialLocation: '/SignUp',
  routes: [
    GoRoute(
      path: '/Splash',
      builder: (context, state) => SplashScreen(
        onStartCooking: () => context.go('/SignIn'),
      ),
    ),
    GoRoute(
      path: '/SignIn',
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: '/SignUp',
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: '/SavedRecipes',
      builder: (context, state) => FutureBuilder(
        future: GetSavedRecipesUseCase(
          recipeRepository: MockRecipeRepositoryImpl(),
          bookmarkRepository: MockBookmarkRepositoryImpl(),
        ).execute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            final recipes = snapshot.data!;
            return SavedRecipesScreen(recipes: recipes);
          }
          return Center(child: Text('No data'));
        },
      ),
    ),
  ],
);
