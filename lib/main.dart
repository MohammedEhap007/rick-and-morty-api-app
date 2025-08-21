import 'package:flutter/material.dart';

import 'helper/setup_get_it.dart';
import 'rick_and_morty_api_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const RickAndMortyApiApp());
}
