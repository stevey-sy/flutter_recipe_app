import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/filter_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/rating_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/two_tab.dart';
import 'package:flutter_recipe_app/core/presentation/dialogs/rating_dialog.dart';
import 'package:flutter_recipe_app/data/repository/mock_bookmark_repository.dart';
import 'package:flutter_recipe_app/data/repository/mock_reipe_repository_impl.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:flutter_recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/sign_in/sign_in_screen.dart';

import 'core/presentation/components/input_field.dart';
import 'core/presentation/components/medium_button.dart';
import 'core/presentation/components/small_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: FutureBuilder(
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
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => RatingDialog(
                  title: 'Rate recipe',
                  score: 3,
                  actionName: 'send',
                  onChange: (int score) {
                    print('Score: $score');
                  },
                ),
              );
            },
            child: const Text('Show Rating Dialog'),
          ),
          TwoTab(
            labels: ['Label 1', 'Label 2'],
            selectedIndex: 0,
            onChange: (index) {
              print('Index: $index');
            },
          ),
          RatingButton('Text'),
          RatingButton('Text', isSelected: true),
          FilterButton('Text'),
          FilterButton('Text', isSelected: true),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BigButton(
              'Big Button',
              onPressed: () {
                print('Button pressed');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MediumButton(
              'Medium Button',
              onPressed: () {
                print('Button pressed');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmallButton(
              'Small Button',
              onPressed: () {
                print('Button pressed');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputField(
              label: 'Label',
              placeholder: 'placeholder',
              controller: TextEditingController(),
            ),
          ),
        ],
      ),
    );
  }
}
