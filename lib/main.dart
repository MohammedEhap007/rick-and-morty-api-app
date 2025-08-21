import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helper/custom_bloc_observer.dart';
import 'helper/setup_get_it.dart';
import 'rick_and_morty_api_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  setupGetIt();
  runApp(const RickAndMortyApiApp());
}
