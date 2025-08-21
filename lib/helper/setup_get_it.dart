import 'package:get_it/get_it.dart';

import '../data/repos/characters_repo.dart';
import '../data/services/character_api_service.dart';
import '../presentation/logic/cubits/characters_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<CharacterApiService>(CharacterApiService());

  getIt.registerSingleton<CharactersRepo>(
    CharactersRepo(getIt<CharacterApiService>()),
  );

  getIt.registerLazySingleton<CharactersCubit>(
    () => CharactersCubit(getIt<CharactersRepo>()),
  );
}
