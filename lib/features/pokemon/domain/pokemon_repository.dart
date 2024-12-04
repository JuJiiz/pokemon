import 'package:pokemon/features/pokemon/domain/models/get_pokemon_list_request_entity.dart';
import 'package:pokemon/features/pokemon/domain/models/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemonList({
    required GetPokemonListRequestEntity input,
  });
}
