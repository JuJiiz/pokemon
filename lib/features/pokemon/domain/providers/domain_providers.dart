import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/core/services/network_service.dart';
import 'package:pokemon/features/pokemon/data/pokemon_repository_impl.dart';
import 'package:pokemon/features/pokemon/domain/pokemon_repository.dart';
import 'package:pokemon/features/pokemon/domain/use_cases/get_pokemon_list_use_case.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>(
  (ref) => PokemonRepositoryImpl(
    networkService: ref.watch(networkServiceProvider),
  ),
);

final getPokemonListUseCaseProvider = Provider<GetPokemonListUseCase>(
  (ref) => GetPokemonListUseCase(
    pokemonRepository: ref.watch(pokemonRepositoryProvider),
  ),
);
