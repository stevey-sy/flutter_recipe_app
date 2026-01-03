import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SearchInputField extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final bool readOnly;
  final void Function(String query)? onChanged;
  const SearchInputField({
    super.key,
    required this.placeholder,
    this.controller,
    this.readOnly = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        onChanged: (query) => onChanged?.call(query),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: ColorStyles.gray4,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorStyles.gray4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorStyles.primary80,
            ),
          ),
          hintText: placeholder,
          hintStyle: TextStyles.smallTextRegular.copyWith(
            color: ColorStyles.gray3,
          ),
        ),
      ),
    );
  }
}
