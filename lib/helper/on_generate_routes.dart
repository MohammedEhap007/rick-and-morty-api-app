import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../presentation/views/characters_details_view.dart';
import '../presentation/views/characters_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case charactersView:
      return MaterialPageRoute(
        builder: (context) => const CharactersView(),
      );

    case charactersDetailsView:
      return MaterialPageRoute(
        builder: (context) => const CharactersDetailsView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
