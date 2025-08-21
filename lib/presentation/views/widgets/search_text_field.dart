import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_app/constants/app_colors.dart';

import '../../../data/models/character_model.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.searchTextController,
  });

  final TextEditingController searchTextController;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.searchTextController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 18),
      ),
      style: const TextStyle(fontSize: 18),
    );
  }
}
