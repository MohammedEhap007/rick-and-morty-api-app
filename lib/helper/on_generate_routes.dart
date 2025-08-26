import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_strings.dart';
import '../data/models/character_model.dart';
import '../presentation/logic/cubits/characters_cubit.dart';
import '../presentation/views/characters_details_view.dart';
import '../presentation/views/characters_view.dart';
import 'setup_get_it.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case charactersView:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt<CharactersCubit>(),
          child: const CharactersView(),
        ),
      );

    case charactersDetailsView:
      // Get the character model from the route arguments
      final characterModel = settings.arguments as CharacterModel;
      return MaterialPageRoute(
        builder: (context) =>
            // Pass the character model to the details view
            CharactersDetailsView(characterModel: characterModel),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
