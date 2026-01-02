import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/route_paths.dart';
import 'package:flutter_recipe_app/data/repository/mock_bookmark_repository.dart';
import 'package:flutter_recipe_app/data/repository/mock_reipe_repository_impl.dart';
import 'package:flutter_recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/presentation/saved_recipes/screen/saved_recipes_root.dart';
import 'package:flutter_recipe_app/presentation/saved_recipes/screen/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart'
    show GoRouter, GoRoute, GoRouterHelper;

final router = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) => SplashScreen(
        onStartCooking: () => context.go(RoutePaths.signIn),
      ),
    ),
    GoRoute(
      path: RoutePaths.signIn,
      builder: (context, state) => SignInScreen(
        onTapSignUp: () => context.go(RoutePaths.signUp),
        onTapSignIn: () =>
            context.go(RoutePaths.savedRecipes),
      ),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) => SignUpScreen(
        onTapSignIn: () => context.go(RoutePaths.signIn),
      ),
    ),
    GoRoute(
      path: RoutePaths.savedRecipes,
      builder: (context, state) => const SavedRecipesRoot(),
    ),
  ],
);
