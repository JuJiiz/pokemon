import 'package:pokemon/features/pokemon/domain/models/get_pokemon_list_request_entity.dart';
import 'package:pokemon/features/pokemon/domain/models/pokemon_entity.dart';
import 'package:pokemon/features/pokemon/domain/pokemon_repository.dart';

class GetPokemonListUseCase {
  final PokemonRepository _pokemonRepository;

  const GetPokemonListUseCase({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  Future<List<PokemonEntity>> call({
    required int offset,
    required int perPage,
  }) async {
    final input = GetPokemonListRequestEntity(
      offset: offset,
      perPage: perPage,
    );
    return await _pokemonRepository.getPokemonList(input: input);
  }
}
