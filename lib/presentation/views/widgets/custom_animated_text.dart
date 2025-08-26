import 'dart:ffi';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_app/constants/app_colors.dart';

import '../../../data/models/character_model.dart';

class CustomAnimatedText extends StatelessWidget {
  CustomAnimatedText({super.key, required this.characterModel});

  final CharacterModel characterModel;

  final colorizeColors = [
    Colors.white,
    AppColors.backgroundColor,
    AppColors.mortyColor,
    Colors.pink,
    Colors.blue,
  ];

  final colorizeTextStyle = const TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedTextKit(
              totalRepeatCount: 10,
              animatedTexts: [
                ColorizeAnimatedText(
                  'Name: ${characterModel.name}',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
                ColorizeAnimatedText(
                  'Species: ${characterModel.species}',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
                ColorizeAnimatedText(
                  'Gender: ${characterModel.gender}',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
                RotateAnimatedText(
                  'Status: ${characterModel.status}',
                  textStyle: colorizeTextStyle,
                ),
                RotateAnimatedText(
                  'Origin: ${characterModel.origin.name}',
                  textStyle: colorizeTextStyle,
                ),
                WavyAnimatedText(
                  'Location: ${characterModel.location.name}',
                  textStyle: colorizeTextStyle,
                ),
                WavyAnimatedText(
                  'Episodes Appeared In: ${characterModel.episode.length}',
                  textStyle: colorizeTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
