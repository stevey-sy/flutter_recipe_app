// ignore_for_file: annotate_overrides

import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  final List<Recipe> recipes;
  final bool isLoading;

  SearchState({
    this.recipes = const [],
    this.isLoading = false,
  });
}
