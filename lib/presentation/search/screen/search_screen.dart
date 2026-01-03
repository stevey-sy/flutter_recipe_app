import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/recipe_grid_item.dart';
import 'package:flutter_recipe_app/core/presentation/components/search_input_field.dart';
import 'package:flutter_recipe_app/presentation/search/search_state.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchScreen extends StatelessWidget {
  final SearchState state;
  final void Function(String query)? onChanged;

  const SearchScreen({
    super.key,
    required this.state,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search recipes',
          style: TextStyles.mediumTextBold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 17),
            Row(
              children: [
                Expanded(
                  child: SearchInputField(
                    placeholder: 'Search for a recipe',
                    onChanged: (query) =>
                        onChanged?.call(query),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyles.primary100,
                  ),
                  child: Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  state.searchTitle,
                  style: TextStyles.normalTextBold,
                ),
                const Spacer(),
                Text(
                  state.resultsCount,
                  style: TextStyles.smallerTextRegular
                      .copyWith(color: ColorStyles.gray3),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                          ),
                      itemBuilder: (context, index) {
                        return RecipeGridItem(
                          recipe: state.recipes[index],
                        );
                      },
                      itemCount: state.recipes.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
