import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_app/constants/app_colors.dart';

class CustomCharacterDetailsDivider extends StatelessWidget {
  const CustomCharacterDetailsDivider({super.key, required this.endIndent});

  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      thickness: 2,
      endIndent: endIndent,
      color: AppColors.mortyColor,
    );
  }
}
