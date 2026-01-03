import 'package:flutter_recipe_app/core/routing/route_paths.dart';
import 'package:flutter_recipe_app/main.dart';
import 'package:flutter_recipe_app/presentation/home/screen/home_root.dart';
import 'package:flutter_recipe_app/presentation/main/main_screen.dart';
import 'package:flutter_recipe_app/presentation/notifications/notifications_screen.dart';
import 'package:flutter_recipe_app/presentation/profile/profile_screen.dart';
import 'package:flutter_recipe_app/presentation/saved_recipes/screen/saved_recipes_root.dart';
import 'package:flutter_recipe_app/presentation/search/screen/search_root.dart';
import 'package:flutter_recipe_app/presentation/search/screen/search_screen.dart';
import 'package:flutter_recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart'
    show
        GoRouter,
        GoRoute,
        GoRouterHelper,
        StatefulShellRoute,
        StatefulShellBranch;

final router = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.test,
      builder: (context, state) => const HomePage(),
    ),
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
        onTapSignIn: () => context.go(RoutePaths.home),
      ),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (context, state) => SignUpScreen(
        onTapSignIn: () => context.go(RoutePaths.signIn),
      ),
    ),
    GoRoute(
      path: RoutePaths.search,
      builder: (context, state) => const SearchRoot(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainScreen(
            body: navigationShell,
            currentPageIndex: navigationShell.currentIndex,
            onPageChanged: (index) =>
                navigationShell.goBranch(
                  index,
                  initialLocation:
                      index == navigationShell.currentIndex,
                ),
          ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.home,
              builder: (context, state) => const HomeRoot(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.savedRecipes,
              builder: (context, state) =>
                  const SavedRecipesRoot(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.notifications,
              builder: (context, state) =>
                  NotificationsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.profile,
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
