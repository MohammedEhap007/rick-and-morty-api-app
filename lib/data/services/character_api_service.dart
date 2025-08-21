import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_api_app/constants/app_strings.dart';

class CharacterApiService {
  late final Dio _dio;

  CharacterApiService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    _dio = Dio(baseOptions);
  }

  Future<Map<String, dynamic>> getAllCharacter() async {
    try {
      Response response = await _dio.get(charactersEndpoint);

      if (response.statusCode == 200 && response.data != null) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load characters: ${response.statusCode}');
      }
    } catch (e) {
      log('API Error: ${e.toString()}');
      rethrow; // Re-throw the error instead of returning empty map
    }
  }
}
