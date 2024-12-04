import 'dart:developer';

import 'package:pokemon/core/models/app_exceptions.dart';
import 'package:pokemon/core/services/network_service.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_list_response_raw.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_raw.dart';
import 'package:pokemon/features/pokemon/domain/models/get_pokemon_list_request_entity.dart';
import 'package:pokemon/features/pokemon/domain/models/pokemon_entity.dart';
import 'package:pokemon/features/pokemon/domain/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  static PokemonRepositoryImpl? _instance;

  final NetworkService _networkService;

  const PokemonRepositoryImpl._(this._networkService);

  factory PokemonRepositoryImpl({
    required NetworkService networkService,
  }) {
    return _instance ??= PokemonRepositoryImpl._(networkService);
  }

  @override
  Future<List<PokemonEntity>> getPokemonList({
    required GetPokemonListRequestEntity input,
  }) async {
    final json = await _networkService.get(
      path: 'pokemon',
      queryParams: {
        'offset': input.offset,
        'limit': input.perPage,
      },
    );

    final response = PokemonListResponseRaw.fromJson(json);
    final items = response.results ?? [];

    final List<PokemonEntity> entities = [];
    for (final raw in items) {
      final entity = raw.toEntity();
      if (entity != null) entities.add(entity);
    }
    return entities;
  }
}
