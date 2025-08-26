import 'package:flutter/material.dart';

class CharacterDetailsItem extends StatelessWidget {
  const CharacterDetailsItem({
    super.key,
    required this.detailTitle,
    required this.detailValue,
  });

  final String detailTitle;
  final String detailValue;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: detailTitle,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: detailValue,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
