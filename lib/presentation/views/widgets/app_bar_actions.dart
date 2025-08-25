import 'package:flutter/material.dart';

List<Widget> appBarActions({
  required bool isSearching,
  required VoidCallback onStartSearch,
  required VoidCallback onStopSearch,
}) {
  if (isSearching) {
    return [
      IconButton(
        onPressed: onStopSearch,
        icon: const Icon(Icons.clear),
      ),
    ];
  } else {
    return [
      IconButton(
        onPressed: onStartSearch,
        icon: const Icon(
          Icons.search,
        ),
      ),
    ];
  }
}
