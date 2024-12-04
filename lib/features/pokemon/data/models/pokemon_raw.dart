import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/core/extensions/string_extension.dart';
import 'package:pokemon/features/pokemon/domain/models/pokemon_entity.dart';

part 'pokemon_raw.freezed.dart';

part 'pokemon_raw.g.dart';

@Freezed(
  toJson: false,
  fromJson: true,
)
class PokemonRaw with _$PokemonRaw {
  const PokemonRaw._();

  factory PokemonRaw({
    @JsonKey(name: 'name') final String? name,
    @JsonKey(name: 'url') final String? url,
  }) = _PokemonRaw;

  factory PokemonRaw.fromJson(Map<String, dynamic> json) =>
      _$PokemonRawFromJson(json);

  PokemonEntity? toEntity() {
    final name = this.name;
    final id =
        url?.split('/').lastWhereOrNull((e) => e.isNotEmpty)?.tryParseInt();

    if (name == null || id == null) return null;

    final imageUrl = 'https://img.pokemondb.net/artwork/$name.jpg';

    return PokemonEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
    );
  }
}
