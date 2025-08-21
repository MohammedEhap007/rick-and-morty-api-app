import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_strings.dart';
import '../data/repos/characters_repo.dart';
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
      return MaterialPageRoute(
        builder: (context) => const CharactersDetailsView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(),
      );
  }
}
